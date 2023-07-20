//
//  TrailerCellView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 23/06/23.
//

import SwiftUI
import Kingfisher

struct TrailerCellView: View {
    
    let urlMovie: String
    let trailer: Trailer?
    
    var body: some View {
        
        HStack(spacing: 10.0) {
            KFImage(URL(string: "\(Constants.urlImages)\(urlMovie)"))
                .resizable()
                .placeholder({ progres in
                    ProgressView()
                })
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 70)
                .cornerRadius(12)
                .shadow(radius: 12)
            
            Spacer()
            
            VStack(alignment: .center, spacing: 3.0) {
                Text(trailer?.name ?? "")
                    .lineLimit(2)
                    .font(.body)
                    .foregroundColor(.accentColor)
                
                Text(trailer?.published_at.prefix(10) ?? "")
                    .font(.footnote)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct TrailerCellView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerCellView(urlMovie: "", trailer: nil)
            .previewLayout(.sizeThatFits)
    }
}


