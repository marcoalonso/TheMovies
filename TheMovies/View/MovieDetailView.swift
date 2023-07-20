//
//  MovieDetailView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 22/06/23.
//

import SwiftUI
import YouTubeiOSPlayerHelper
import Kingfisher

struct MovieDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel = TrailerViewModel()
    @State private var showTrailer = false
    @State private var urlTrailerSelected: String = ""
    @State private var isShowingActivityView = false
    @State private var isFavourite = false
    @State private var downloadedImage: Image?
    
    let movie: DataMovie?
    var idVideo: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20.0) {
                ///Trailer View
                if !viewModel.listOfTrailers.isEmpty {
                    YTWrapper(videoID: "\(viewModel.listOfTrailers[0].key)")
                        .frame(height: 200)
                        .cornerRadius(12)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                }
                
                ///Title
                Text(movie?.title ?? movie?.original_title ?? "")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                ///Description
                Text(movie?.overview ?? "")
                    .multilineTextAlignment(.center)
                    .font(.caption)
                
                HStack {
                    Text("Estreno \(movie?.release_date ?? "")")
                        .font(.title3)
                    Button {
                        //Mark as favourite
                        isFavourite = true
                        //                    if let movieToSave = movie {
                        //                        let newFavouriteMovie = FavouriteMovie(context: self.viewContext)
                        //                        if let title = movieToSave.title ?? movieToSave.original_title {
                        //                            newFavouriteMovie.titulo = movieToSave.original_title
                        //                        } else {
                        //                            newFavouriteMovie.titulo = ""
                        //                        }
                        //                        newFavouriteMovie.id = Int64(movieToSave.id ?? 0)
                        //                        newFavouriteMovie.descripcion = movieToSave.overview
                        //                        newFavouriteMovie.fecha = movieToSave.release_date
                        //                        let data =
                        //                        newFavouriteMovie.poster =
                        //
                        //                    }
                        
                        
                    } label: {
                        Image(systemName: isFavourite ? "heart.fill" : "heart")
                    }
                    
                }
                
                ScrollView {
                    ForEach(viewModel.listOfTrailers, id: \.key) { trailer in
                        TrailerCellView(urlMovie: movie?.backdrop_path ?? "", trailer: trailer)
                            .onTapGesture {
                                self.urlTrailerSelected = trailer.key
                                print("Debug: \(self.urlTrailerSelected)")
                                showTrailer = true
                            }
                    }
                }
                
                .frame(height: 300)
                
                ///Image
                KFImage(URL(string: "\(Constants.urlImages)\(movie?.backdrop_path ?? Constants.placeholder)"))
                    .resizable()
                    .placeholder({ progres in
                        ProgressView()
                    })
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .shadow(radius: 12)
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                
                
                .navigationBarItems(trailing: Button(action: {
                    isShowingActivityView = true
                }, label: {
                    Image(systemName: "square.and.arrow.up.fill")
                }))
            }//Vstack
            .sheet(isPresented: $showTrailer, content: {
                TrailerFullScreenView(urlTrailer: $urlTrailerSelected)
            })
            .sheet(isPresented: $isShowingActivityView, content: {
                ActivityView(activityItems: ["https://apps.apple.com/us/app/movieverse-world/id6447369429"])
            })
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
            .onAppear {
                viewModel.getTrailers(id: movie?.id ?? 536437)
            }
            .padding(5)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: nil, idVideo: "0LiuqkDZbRw")
    }
}

struct YTWrapper : UIViewRepresentable {
    var videoID : String
    
    func makeUIView(context: Context) -> YTPlayerView {
        let playerView = YTPlayerView()
        playerView.load(withVideoId: videoID)
        return playerView
    }
    
    func updateUIView(_ uiView: YTPlayerView, context: Context) {
    }
}

