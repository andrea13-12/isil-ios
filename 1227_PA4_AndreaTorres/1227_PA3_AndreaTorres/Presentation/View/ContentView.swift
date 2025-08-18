//
//  ContentView.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject  var cartViewModel: CartViewModel
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            
            Tab("Order", systemImage: "list.bullet.rectangle.portrait.fill") {
                Text("Order")
            }
            
            Tab("Favorites", systemImage: "heart") {
                FavoritesView()
            }
            
            Tab("Cart", systemImage: "bag") {
                CartView()
            }
            
            Tab("Profile", systemImage: "person") {
                Text("Profile")
            }
        }
        .tint(ColorPalette.primary)
    }
}

#Preview {
    ContentView()
        .environmentObject(HomeViewModel())
        .environmentObject(CartViewModel()) 
}
