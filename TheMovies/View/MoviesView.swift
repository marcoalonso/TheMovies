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
                
                Text("Proximos estrenos")
                    .font(.title)
                    .foregroundColor(.accentColor)
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: gridItemLayout, spacing: 50) {
                            ForEach(viewModel.upcomingMovies, id: \.id) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    MovieCell(movie: movie)
                                }
                            }
                        }///LazyHGrid
                }//Scrolview
                
                Text("Ahora en cines")
                    .font(.title)
                    .foregroundColor(.accentColor)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: gridItemLayout, spacing: 50) {
                            ForEach(viewModel.nowplayingMovies, id: \.id) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    MovieCell(movie: movie)
                                }
                            }
                        }///LazyHGrid
                }//Scrolview
                
                Text("Tendencia")
                    .font(.title)
                    .foregroundColor(.accentColor)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: gridItemLayout, spacing: 50) {
                            ForEach(viewModel.trendingMovies, id: \.id) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    MovieCell(movie: movie)
                                }
                            }
                        }///LazyHGrid
                }//Scrolview
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}


