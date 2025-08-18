//
//  MovieDTO.swift
//  EasyMovie
//
//  Created by Andrea Torres on 7/07/25.
//

//contiene todas las respuestas
struct MoviesDTO: Decodable{
    let movies: [MoviesDTO]
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
//solo 1 pelicula
struct MovieDTO: Decodable{
    let id: Int
    let title:String
    let poster: String
    let overview: String

enum CodingKeys: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
        case overview
    }
    
func toDomain () -> Movie{
    Movie(id: id,
          title: title,
          poster: "https://image.tmdb.org/t/p/original/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg\(poster)",
          overview: overview)
    }
}
