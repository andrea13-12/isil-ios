//
//  ProductListViewModel.swift
//  Inventory
//
//  Created by Andrea Torres on 19/05/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published private(set) var products = [Product]()
    
    let productDao = ProductDao()
    
    //creamos una funcion para agrgar productos
    func addProduct(product: Product){
        productDao.addProduct(product: product)
        fetchProducts()
    }
    
    //minimuscula es el parametro
    // mayuscula es tipo
    func deleteProduct(indexSet: IndexSet) {
        if let index = indexSet.first {
            productDao.deleteProduct(id: products[index].id)
            fetchProducts()
        }
    }
    
    func updateProduct(product: Product) {
        productDao.updateProduct(product: product)
        fetchProducts()
    }
    
    private func fetchProducts() {
        products = productDao.fetchProducts()
    }
    init () {
        fetchProducts()
    }
}
