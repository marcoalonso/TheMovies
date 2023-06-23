//
//  ContentView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = MoviesViewModel()
    
    var body: some View {
        VStack {
            Text("Movies Founded: \(viewModel.movies.count)")
            
            AsyncImage(url: URL(string: "\(Constants.urlImages)\(viewModel.movies.first?.poster_path ?? Constants.placeholder)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 350, height: 350)
            .cornerRadius(15)
            .shadow(radius: 12)
            
            Spacer()
        }.onAppear { viewModel.getLisOfNews() }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
