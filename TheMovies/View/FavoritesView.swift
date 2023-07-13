//
//  ProfileView.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 12/07/23.
//

import SwiftUI

struct FavoritesView: View {
    
    let numberColums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: numberColums, spacing: 20) {
                    ForEach(0 ... 19, id: \.self) { movie in
                        Image("barbie")
                            .resizable()
                            .frame(maxHeight: 200)
                            .cornerRadius(25)
                            .shadow(radius: 8)
                    }
                }
                
                
            }
            .padding(.horizontal)
            .navigationBarTitle("Favoritas", displayMode: .inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
