//
//  TheMoviesApp.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 20/06/23.
//

import SwiftUI

@main
struct TheMoviesApp: App {
    @AppStorage("isDarkModeOn") private var isDarkModeOn = false
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(isDarkModeOn ? .dark : .light)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
