//
//  ContentView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }.onAppear {
            NetworkManager.shared.getLisOfNews { result in
                switch result {
                case .success(let movies):
                    print("Movies: \(movies.count)")
                    print("1 Movie: \(movies.first)")
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        print("Error invalidData")
                        
                    case .invalidURL:
                        print("Error invalidURL")
                        
                    case .invalidResponse:
                        print("Error invalidResponse")
                        
                    case .unableToComplete:
                        print("Error unableToComplete")
                    case .decodingError:
                        print("Error decodingError")
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
