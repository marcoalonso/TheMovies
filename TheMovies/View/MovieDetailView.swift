//
//  MovieDetailView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 22/06/23.
//

import SwiftUI
import YouTubeiOSPlayerHelper

struct MovieDetailView: View {
    
    let idVideo: String
    
    var body: some View {
        VStack {
            YTWrapper(videoID: idVideo)
                            .frame(height: 300)
                            .cornerRadius(12)
            
            Spacer()
        }.padding(15)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(idVideo: "0LiuqkDZbRw")
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

