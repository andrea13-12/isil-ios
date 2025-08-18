//
//  ContentView.swift
//  SuperFind
//
//  Created by Andrea Torres on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Search", systemImage: "magnifyingglass") {
                FindHeroView()
            }
            Tab("Favorites", systemImage: "heart") {
                FavoriteListView()
            }
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
