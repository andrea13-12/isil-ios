//
//  FavoriteProductEntity+Extensions.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 27/06/25.
//

extension FavoriteProductEntity {
    func fromDomain(favorite: FavoriteProduct) {
        self.id = Int16(favorite.id)
        self.title = favorite.title
        self.image = favorite.image
        self.price = Double(favorite.price)
    }
    
    func toDomain() -> FavoriteProduct {
        FavoriteProduct(id: Int(id), title: title ?? "", image: image ?? "", price: Double(price))
    }
}
