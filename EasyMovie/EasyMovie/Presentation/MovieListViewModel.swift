//
//  MovieListViewModel.swift
//  EasyMovie
//
//  Created by Andrea Torres on 7/07/25.
//

import Foundation
class MovieListViewModel:ObservableObject {
    @Published var uiState: UIState<[Movie]> = .initialState
    
    //fun que nos permita buscar las peliculas
    func searchMovie(query:String){
        uiState = .loadingState
        
        //para que algo se ejecute dsp de 2seg se usa DISPATCHQUEUE
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.uiState = .successState([
                Movie(id: 1297763, title: "ニンジャバットマン対ヤクザリーグ", poster: "https://image.tmdb.org/t/p/original//sVVT6GYFErVv0Lcc9NvqCu0iOxO.jpg", overview: "The Batman family has returned to the present to discover that Japan has disappeared, and a giant island - Hinomoto - is now in the sky over Gotham City.  At the top sit the Yakuza, a group of superpowered individuals who reign without honor or humanity and look suspiciously like the Justice League. Now, it’s up to Batman and his allies to save Gotham!")
            ])
        }
    }
}
