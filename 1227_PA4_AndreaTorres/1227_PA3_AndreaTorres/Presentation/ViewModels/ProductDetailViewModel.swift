//
//  ProductDetailViewModel.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 28/06/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    let dao = FavoriteProductDao.shared
    @Published var isFavorite = false
    
    func checkFavorite(id: Int) {
        isFavorite = dao.checkFavorite(id: id)
    }
    
    func toggleFavorite(product : Product) {
        isFavorite.toggle()
        
        if (isFavorite) {
            addFavorite(product : product)
        } else {
            removeFavorite(id: product.id)
        }
    }
    
    private func removeFavorite(id: Int) {
        dao.deleteFavorite(id: id)
    }
    
    private func addFavorite(product : Product) {
        
        dao.insertFavorite(favorite: FavoriteProduct(id: product.id, title: product.title, image: product.image, price: product.price))
    }
}
