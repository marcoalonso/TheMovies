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
                    Image(systemName: "gearshape")
                }
        }
        .accentColor(.accentColor)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
