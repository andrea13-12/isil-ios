//
//  Product.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 10/06/25.
//

struct Product:  Identifiable, Codable, Equatable  {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Double
    let ratingCount: Int
    var isFavorite: Bool = false
    var quantity: Int = 1 
}
