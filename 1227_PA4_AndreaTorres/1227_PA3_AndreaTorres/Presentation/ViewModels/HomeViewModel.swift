//
//  HomeViewModel.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 11/06/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var state: UIState<[Product]> = .idle
    private let shopService = ShopService()
    
    func toggleFavorite(for productId: Int) {
           if case .success(var products) = state {
               if let index = products.firstIndex(where: { $0.id == productId }) {
                   products[index].isFavorite.toggle()
                   self.state = .success(products)
               }
           }
       }
       
       func getFavoriteProducts() -> [Product] {
           if case .success(let products) = state {
               return products.filter { $0.isFavorite }
           }
           return[]
       }
    
    init(){
        getProducts()
    }
    
    func getProducts() {
        self.state = .loading
        
        shopService.getProducts { data, message in
            
            DispatchQueue.main.async {
                if let data = data {
                    self.state = .success(data)
                } else {
                    self.state = .failure(message ?? "Unknown error")
                }
            }
            
        }
        
    }
}
