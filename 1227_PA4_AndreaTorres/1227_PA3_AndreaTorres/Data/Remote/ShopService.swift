//
//  ShopService.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 10/06/25.
//

import Foundation

class ShopService {
    let url = "https://sugary-wool-penguin.glitch.me/products"
    
    func getProducts(completion: @escaping ([Product]?, String?) -> Void) {
        HttpRequestHelper().GET(url: url) { data, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do{
                let product = try JSONDecoder().decode([ProductResponse].self, from: data).map { productResponse in
                    productResponse.toDomain()
                }
                completion(product, nil)
            } catch let decodingError {
                completion(nil,String(describing: decodingError))
            }
        }
    }
}
