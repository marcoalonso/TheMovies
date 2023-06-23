//
//  MovieCell.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 23/06/23.
//

import SwiftUI
import Kingfisher

struct MovieCell: View {
    
    let movie: DataMovie
    
    var body: some View {
        VStack {
            KFImage(URL(string: "\(Constants.urlImages)\(movie.poster_path ?? Constants.placeholder)"))
                .resizable()
                .placeholder({ progres in
                    ProgressView()
                })
                .cornerRadius(12)
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: MockData.movie)
    }
}
