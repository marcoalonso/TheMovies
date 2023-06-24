//
//  MovieDetailView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 22/06/23.
//

import SwiftUI
import YouTubeiOSPlayerHelper

struct MovieDetailView: View {
    
    @StateObject private var viewModel = TrailerViewModel()
    @State private var showTrailer = false
    @State private var urlTrailerSelected: String = ""
    @State private var isShowingActivityView = false
    
    let movie: DataMovie?
    var idVideo: String = ""
    
    var body: some View {
        VStack(spacing: 10.0) {
            
            if !viewModel.listOfTrailers.isEmpty {
                YTWrapper(videoID: "\(viewModel.listOfTrailers[0].key)")
                    .frame(height: 200)
                    .cornerRadius(12)
            }
           
            if viewModel.isLoading {
                ProgressView()
            }
            
            Text(movie?.overview ?? "")
                .multilineTextAlignment(.center)
                .font(.body)
            
            Text(movie?.release_date ?? "")
                .font(.title3)
            
            
            Section(header:
                        Text("Trailers")
                        .font(.title2)
                        .foregroundColor(.accentColor)
                    
            ) {
                List(viewModel.listOfTrailers, id: \.key) { trailer in
                    TrailerCellView(urlMovie: movie?.backdrop_path ?? "", trailer: trailer)
                        .onTapGesture {
                        self.urlTrailerSelected = trailer.key
                            print("Debug: \(self.urlTrailerSelected)")

                        showTrailer = true
                    }
                }
                .listStyle(.inset)
                .frame(maxHeight: 300)

            }//Header
                .navigationBarTitle(movie?.title ?? movie?.original_title ?? "", displayMode: .inline)
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

