//
//  MoviesViewModel.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 22/06/23.
//

import Foundation

final class MoviesViewModel: ObservableObject {
    @Published var upcomingMovies: [DataMovie] = []
    @Published var nowplayingMovies: [DataMovie] = []
    @Published var trendingMovies: [DataMovie] = []
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?
    
    init() {
        getLisOfUpcomingMovies()
        getMoviesNowPlaying()
        getMoviesTrending()
    }
    
    func getMoviesTrending() {
        isLoading = true
        
        NetworkManager.shared.getMoviesTrending() { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false
                switch result {
                case .success(let movies):
                    self.trendingMovies = movies
                    
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
    
    func getMoviesNowPlaying() {
        isLoading = true
        
        NetworkManager.shared.getMoviesNowPlaying() { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false
                switch result {
                case .success(let movies):
                    self.nowplayingMovies = movies
                    
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
    
    func getLisOfUpcomingMovies() {
        isLoading = true
        
        NetworkManager.shared.getLisOfUpcomingMovies { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.isLoading = false
                switch result {
                case .success(let movies):
                    self.upcomingMovies = movies
                    
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

