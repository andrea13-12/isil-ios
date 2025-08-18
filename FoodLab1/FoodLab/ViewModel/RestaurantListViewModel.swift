//
//  ResturantListViewModel.swift
//  FoodLab
//
//  Created by Andrea Torres on 30/06/25.
//

import Foundation

class RestaurantListViewModel: ObservableObject{
    //observable let u share estados
    @Published var uiState: UIState<[Restaurant]> = .initialState
    
    func getAllRestaurants(){
        uiState = .loadingState
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            Restaurant(id: 1, title: "Osaka", poster: "https://media-cdn.tripadvisor.com/media/photo-s/15/9d/92/de/iluminacion-calida-influencia.jpg", latitude: -12.121945, longitude: -77.0305, address: "Av. El Sol 190, Miraflores 15074, Lima, Perú", phone: "+51 1 2220405", rating: 4.7, description: "Osaka Miraflores ofrece una fusión única de cocina japonesa y peruana, conocida como Nikkei. Con un ambiente moderno y sofisticado, es famoso por sus deliciosos makis, sashimis y platos innovadores.")
            
        }
    }
}
