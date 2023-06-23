//
//  TrailerFullScreenView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 23/06/23.
//

import SwiftUI
import YouTubeiOSPlayerHelper

struct TrailerFullScreenView: View {
    @Binding var urlTrailer: String
    
    var body: some View {
        VStack {
            YTWrapper(videoID: urlTrailer)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct TrailerFullScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerFullScreenView(urlTrailer: .constant(MockData.idTrailer))
    }
}
