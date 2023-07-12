//
//  SearchMoviesView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 23/06/23.
//

import SwiftUI

struct SearchMoviesView: View {
    @State private var nameOfMovie = ""
    @StateObject private var viewModel = SearchMoviesViewModel()
    
    private let fixedColumns = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150)),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: fixedColumns, spacing: 20) {
                        ForEach(viewModel.moviesFounded, id: \.id) { movie in
                            NavigationLink {
                                MovieDetailView(movie: movie)
                            } label: {
                                MovieCell(movie: movie)
                                    .frame(width: 150, height: 200)
                            }
                        }
                    }//LazyHGrid
                }.padding(12)
                
            }
            .navigationTitle("Search Movies")
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .searchable(text: $nameOfMovie, prompt: "nombre pelicula")
            .onChange(of: nameOfMovie) { name in
                viewModel.searchMovie(name: name)
            }
        }
    }
}

struct SearchMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMoviesView()
    }
}
