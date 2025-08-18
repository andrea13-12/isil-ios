//
//  ProductResponse.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 10/06/25.
//
struct ProductResponse: Identifiable, Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: ProductRatingResponse
}

struct ProductRatingResponse: Decodable {
    let rate: Double
    let count: Int
}

extension ProductResponse{
    func toDomain() -> Product {
            Product(
                id: id,
                title: title,
                price: price,
                description: description,
                category: category,
                image: image,
                rating: rating.rate,
                ratingCount: rating.count
            )
        }
}
