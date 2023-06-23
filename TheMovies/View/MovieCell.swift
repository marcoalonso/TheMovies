//
//  MovieCell.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 23/06/23.
//

import SwiftUI

struct MovieCell: View {
    
    let movie: DataMovie
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "\(Constants.urlImages)\(movie.poster_path ?? Constants.placeholder)")) { image in
                image
                    .resizable()
                    .frame(width: 150, height: 200)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(12)
                    .shadow(radius: 12)
                
                
            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: MockData.movie)
    }
}
