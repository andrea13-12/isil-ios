//
//  Product.swift
//  Inventory
//
//  Created by Andrea Torres on 12/05/25.
//

import Foundation

// Identifiable: hace que cada producto sea unico
//quantity: para ver el stock
struct Product: Identifiable {
    var id: UUID
    var name: String
    var quantity: Int
}
