//
//  SearchMoviesViewModel.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 23/06/23.
//

import Foundation

class SearchMoviesViewModel: ObservableObject {
    @Published var moviesFounded: [DataMovie] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    
 
    
    func searchMovie(name: String) {
        isLoading = true
        
        NetworkManager.shared.searchMovies(name: name) { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false
                switch result {
                case .success(let movies):
                    self.moviesFounded = movies
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .decodingError:
                        self.alertItem = AlertContext.decodingError
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
