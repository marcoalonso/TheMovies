//
//  ProfileView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 12/07/23.
//

import SwiftUI
import CoreData
import Kingfisher

struct FavoritesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \FavouriteMovie.titulo, ascending: true)],
        animation: .default)
    private var favouriteMovies: FetchedResults<FavouriteMovie>
    
    let numberColums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: numberColums, spacing: 20) {
                    ForEach(favouriteMovies, id: \.id) { movie in
                        
                        NavigationLink {
                            let dataMovie = DataMovie(backdrop_path: movie.urlposter, id: Int(movie.id), original_title: movie.titulo, overview: movie.descripcion, original_language: "", title: movie.titulo, release_date: movie.fecha, poster_path: movie.urlposter)
                            MovieDetailView(movie: dataMovie)
                        } label: {
                            KFImage(URL(string: "\(Constants.urlImages)\(movie.urlposter ?? "")"))
                                .resizable()
                                .placeholder({ progres in
                                    ProgressView()
                                })
                                .frame(maxHeight: 180)
                                .cornerRadius(25)
                                .shadow(radius: 8)
                        }
                    }
                }
                
                
            }
            .padding(.horizontal)
            .navigationBarTitle("Favoritas", displayMode: .inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
