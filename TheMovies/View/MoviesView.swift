//
//  ContentView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject private var viewModel = MoviesViewModel()
    
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVGrid(columns: adaptiveColumns, spacing: 15) {
                        ForEach(viewModel.movies, id: \.id) { movie in
                            NavigationLink {
                                MovieDetailView(movie: movie)
                            } label: {
                                MovieCell(movie: movie)
                            }

                        }
                    }
                }
            }
            .navigationBarTitle("Estrenos", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}


