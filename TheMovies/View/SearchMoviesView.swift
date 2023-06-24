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
    
    var gridItemLayout = [GridItem(.flexible())]
    
    var body: some View {
        
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: gridItemLayout, spacing: 20) {
                    ForEach(viewModel.moviesFounded, id: \.id) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            MovieCell(movie: movie)
                                .frame(width: 200, height: 300)
                        }
                    }
                }//LazyHGrid
            }

        }
        .searchable(text: $nameOfMovie, prompt: "nombre pelicula")
        .onChange(of: nameOfMovie) { name in
            viewModel.searchMovie(name: name)
        }
    }
}

struct SearchMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMoviesView()
    }
}
