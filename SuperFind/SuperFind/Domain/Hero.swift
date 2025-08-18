//
//  FindHero.swift
//  SuperFind
//
//  Created by Andrea Torres on 14/07/25.
//

struct Hero: Identifiable {
    let id: String
    let name: String
    let image: String
    let powerstats: Powerstats
    let biography: Biography
    let appearance: Appearance
    let work: Work
    let connections: Connections
    
    struct Powerstats {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography {
        let fullName: String
        let alterEgos: String
        let aliases: [String]
        let placeOfBirth: String
        let firstAppearance: String
        let publisher: String
        let alignment: String
    }
    
    struct Appearance {
        let gender: String
        let race: String
        let height: [String]
        let weight: [String]
        let eyeColor: String
        let hairColor: String
    }
    
    struct Work {
        let occupation: String
        let base: String
    }
    
    struct Connections {
        let groupAffiliation: String
        let relatives: String
    }
    
}
