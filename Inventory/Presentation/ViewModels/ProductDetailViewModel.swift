//
//  ProductDetailViewModel.swift
//  Inventory
//
//  Created by Andrea Torres on 12/05/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var name = ""
    @Published var quantity = ""
    @Published var errorMessage: String? = nil
    
    //creamos un metodo para validar el producto
    func validate(id: UUID?) -> Product? {
        guard !name.isEmpty else {
            print("Name is empty")
            return nil
        }
        
        guard !quantity.isEmpty else {
            print( "Quantity is empty")
            return nil
        }
        
        guard let quantity = Int(quantity) else {
            errorMessage = "Invalid quantity"
            return nil
        }
        
        errorMessage = nil
        
        return Product(id: id ?? UUID(), name: name, quantity: quantity)
    }
    
    func loadData(product: Product?) {
        if let product = product {
            name = product.name
            quantity = "\(product.quantity)"
        }
    }
    
}
