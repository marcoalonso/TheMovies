//
//  TrailerViewModel.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 23/06/23.
//

import Foundation

class TrailerViewModel: ObservableObject {
    @Published var listOfTrailers: [Trailer] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    
    func getTrailers(id: Int){
        NetworkManager.shared.getLisOfTrailers(id: id) { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                
                switch result {
                case .success(let trailers):
                    self.listOfTrailers = trailers
                    
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
