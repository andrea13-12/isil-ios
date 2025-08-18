//
//  HeroService.swift
//  SuperFind
//
//  Created by Andrea Torres on 14/07/25.
//
import Foundation

class HeroService {
    static let shared = HeroService()
    private init() {}

    let url = "https://superheroapi.com/api/f274286a22873ec9fc7a5782940f7ca2/search/"

    func searchHero(query: String, completion: @escaping([Hero]?, String?) -> Void) {
        guard let url = URL(string: "\(url)\(query)") else {
            completion(nil, "Error: cannot create URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, "Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                completion(nil, "Error: No data received")
                return
            }
            
            if let apiError = try? JSONDecoder().decode(APIError.self, from: data) {
                completion(nil, apiError.error)
                return
            }
            do {
                let result = try JSONDecoder().decode(HerosDTO.self, from: data)
                let heroes = result.heros.map { $0.toDomain() }
                completion(heroes, nil)
            } catch {
                completion(nil, "Error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}

struct APIError: Decodable {
    let error: String
}
