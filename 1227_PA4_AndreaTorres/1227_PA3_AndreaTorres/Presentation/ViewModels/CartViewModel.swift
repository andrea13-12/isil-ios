//
//  CartViewModel.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 11/06/25.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var cartItems: [Product] = []
    
    func addToCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            var newProduct = product
            newProduct.quantity = 1
            cartItems.append(newProduct)
        }
    }
    
    func removeFromCart(productId: Int) {
        cartItems.removeAll { $0.id == productId }
    }
    
    func updateQuantity(productId: Int, newQuantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == productId }) {
            if newQuantity > 0 {
                cartItems[index].quantity = newQuantity
            } else {
                removeFromCart(productId: productId)
            }
        }
    }
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
}
