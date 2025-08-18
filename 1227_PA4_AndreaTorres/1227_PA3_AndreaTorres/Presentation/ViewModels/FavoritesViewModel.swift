//
//  FavoritesViewModel.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 11/06/25.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites = [FavoriteProduct]()
    
    private let dao = FavoriteProductDao.shared
    
    func getAllFavorites() {
        favorites = dao.fetchAllFavorites()
    }
}
