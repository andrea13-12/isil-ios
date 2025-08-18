//
//  ShoeResponse.swift
//  EasyShoes
//
//  Created by Andrea Torres on 2/06/25.
//

struct ShoeResponse: Identifiable, Decodable {
    let id: Int
    let name: String
    let brand: String
    let gender: String
    let category: String
    let price: Int
    let image: String
    let sizes: [ShoeSizeResponse]
    
    enum codingKeys: String, CodingKey {
        case id
        case name
        case brand
        case gender
        case category
        case price
        case image
        case sizes = "sizes_available"
    }
}


enum ShoeGender: String, CaseIterable, Codable {
    case all = "All"
    case men = "Men"
    case women = "Women"
    case kids = "Kids"
}

struct ShoeSizeResponse: Decodable {
    let size: Int
    let quantity: Int
}

//sirve para separar la nuevas funciones del cuero de una clase
extension ShoeResponse {
    func toDomain() -> Shoe {
        Shoe(id: id, name: name, brand: brand, gender: gender, category: category, price: price, image: image)
    }
}
