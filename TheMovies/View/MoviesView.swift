//
//  ContentView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject private var viewModel = MoviesViewModel()
    
   
    var gridItemLayout = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: gridItemLayout, spacing: 50) {
                            ForEach(viewModel.movies, id: \.id) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    MovieCell(movie: movie)
                                }
                            }
                        }///LazyHGrid
                }//Scrolview
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: gridItemLayout, spacing: 50) {
                            ForEach(viewModel.movies, id: \.id) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    MovieCell(movie: movie)
                                }
                            }
                        }///LazyHGrid
                }//Scrolview
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: gridItemLayout, spacing: 50) {
                            ForEach(viewModel.movies, id: \.id) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    MovieCell(movie: movie)
                                }
                            }
                        }///LazyHGrid
                }//Scrolview
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


