//
//  FindHeroViewModel.swift
//  SuperFind
//
//  Created by Andrea Torres on 15/07/25.
//

import Foundation

class FindHeroViewModel: ObservableObject {
    
    @Published var uiState: UIState<[Hero]> = .initialState
    @Published var query = ""
    
    func findHeros() {
        
        uiState = .loadingState
        
        let heroService = HeroService.shared
        
        heroService.searchHero(query: query) { heros, message in
            DispatchQueue.main.async {
                if let heros = heros {
                    self.uiState = .successState(heros)
                } else {
                    self.uiState = .failureState(message ?? "Error: Unknown error")
                }
            }
        }
    }
    
    func toggleFavorite(hero: Hero) {
        let dao = FavoriteDAO.shared
      
    if (dao.isFavorite(id: hero.id)){
            dao.deleteFavorite(id: hero.id)
        }else {
                dao.insertFavorite(hero: hero)
            }
        }
        
        func isFavorite(id: String) -> Bool {
            let dao = FavoriteDAO.shared
            return dao.isFavorite(id: id)
        }
    }
