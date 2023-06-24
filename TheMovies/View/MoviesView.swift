//
//  ContentView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject private var viewModel = MoviesViewModel()
    @State private var goToSearch = false
   
    var gridItemLayout = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10.0) {
                    Text("Próximos estrenos")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: gridItemLayout, spacing: 20) {
                            ForEach(viewModel.upcomingMovies, id: \.id) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    MovieCell(movie: movie)
                                        .frame(width: 200, height: 300)
                                }
                            }
                        }//LazyHGrid
                    }
                    
                    
                    Text("Ahora en cines")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: gridItemLayout, spacing: 20) {
                            ForEach(viewModel.nowplayingMovies, id: \.id) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    MovieCell(movie: movie)
                                        .frame(width: 150, height: 200)
                                }
                            }
                        }//LazyHGrid
                    }
                    
                    Text("Tendencia")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: gridItemLayout, spacing: 20) {
                            ForEach(viewModel.trendingMovies, id: \.id) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    MovieCell(movie: movie)
                                        .frame(width: 300, height: 400)
                                }
                            }
                        }//LazyHGrid
                    }
                }.padding(20)
            }
            .navigationBarTitle("Movieverse World", displayMode: .inline)
            .navigationBarItems(leading: NavigationLink(destination: {
                SearchMoviesView()
            }, label: {
                Image(systemName: "magnifyingglass")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}


