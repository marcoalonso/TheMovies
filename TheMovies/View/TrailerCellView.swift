//
//  TrailerCellView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 23/06/23.
//

import SwiftUI

struct TrailerCellView: View {
    
    let urlMovie: String
    let trailer: Trailer?
    
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: "\(Constants.urlImages)\(urlMovie)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(12)
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 70)
            .shadow(radius: 12)
            .padding(.trailing, 15)
            
            VStack {
                Text(trailer?.name ?? "")
                    .font(.body)
                    .foregroundColor(.accentColor)
                
                Text(trailer?.published_at ?? "")
                    .font(.footnote)
            }.padding(6)
            
        }
    }
}

struct TrailerCellView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerCellView(urlMovie: "", trailer: nil)
    }
}
