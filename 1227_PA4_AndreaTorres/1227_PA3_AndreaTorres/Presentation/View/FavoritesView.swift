//
//  FavoritesView.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 11/06/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel = FavoritesViewModel()
    
    var body: some View {
        VStack {
            if (!viewModel.favorites.isEmpty) {
                List {
                    ForEach(viewModel.favorites) { favorite in
                        FavoriteProductCardView(favorite: favorite) {
                            viewModel.getAllFavorites()
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            } else {
                Text("No favorites")
            }
           
        }
        .onAppear {
            viewModel.getAllFavorites()
        }
    }
}
