//
//  MovieService.swift
//  EasyMovie
//
//  Created by Andrea Torres on 7/07/25.
//

import Foundation
class MovieService{
    let url =
    "https://api.themoviedb.org/3/search/movie?api_key=0fb2259dc60130bd85acb07069f8bb0d&query=batman"
    
    func searchMovie(query: String){
        guard let url = URL(string: "\(url)\(query)") else {
            return
        }
        
        var urlResquest = URLRequest(url: url)
        urlResquest.httpMethod = "GET"
        
        let session = URLSession.shared
        
        session.dataTask(with: urlResquest){ data, response, error in
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return
            }
        }
    }
}
