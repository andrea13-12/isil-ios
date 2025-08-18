//
//  FavoriteProductCardViewModel.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 27/06/25.
//

import Foundation

class FavoriteProductCardViewModel: ObservableObject {
    let dao = FavoriteProductDao.shared
    
    func removeFavorite(id: Int) {
        dao.deleteFavorite(id: id)
    }
}
