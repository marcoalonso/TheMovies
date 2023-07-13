//
//  MainTabView.swift
//  Instagram
//
//  Created by Marco Alonso Rodriguez on 12/07/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                }
            
            SearchMoviesView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                }
            
            FeedbackView()
                .tabItem {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
        }
        .accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
