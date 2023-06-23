//
//  MoviesViewModel.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 22/06/23.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    @Published var movies: [DataMovie] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    
    func getLisOfNews() {
        isLoading = true
        
        NetworkManager.shared.getLisOfNews { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false
                switch result {
                case .success(let movies):
                    self.movies = movies
                    
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

