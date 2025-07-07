//
//  ContentView.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        
        TabView {
            CitiesListView()
              .tabItem { Label("Find Bikes", systemImage: "bicycle") }
            FavoritesListView()
              .tabItem { Label("Favorites", systemImage: "star.fill") }
        }
    }
}
