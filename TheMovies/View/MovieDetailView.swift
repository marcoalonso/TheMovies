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
    
    let movie: DataMovie?
    var idVideo: String = ""
    
    var body: some View {
        VStack {
            Text(movie?.title ?? movie?.original_title ?? "")
            
            if !viewModel.listOfTrailers.isEmpty {
                YTWrapper(videoID: "\(viewModel.listOfTrailers[0].key)")
                                .frame(height: 300)
                                .cornerRadius(12)
            }
           
            if viewModel.isLoading {
                ProgressView()
            }
            
            Text(movie?.overview ?? "")
                
            
            Spacer()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        .onAppear {
            viewModel.getTrailers(id: movie?.id ?? 536437)
        }
        .padding(15)
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

