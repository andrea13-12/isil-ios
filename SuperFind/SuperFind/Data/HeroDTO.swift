//
//  HeroDTO.swift
//  SuperFind
//
//  Created by Andrea Torres on 14/07/25.
//
struct HerosDTO: Decodable {
    let results: [HeroDTO]
    
    var heros: [HeroDTO] {results}
}
        
struct HeroDTO: Decodable {
    let id: String
    let name: String?
    let powerstats: Powerstats?
    let biography: Biography?
    let appearance: Appearance?
    let work: Work?
    let connections: Connections?
    let image: ImageDTO?
    
    struct ImageDTO: Decodable {
        let url: String?
    }

    func toDomain() -> Hero {
        Hero(
            id: id,
            name: name ?? "",
            image: image?.url ?? "",
            powerstats: powerstats?.toDomain() ?? Hero.Powerstats(intelligence: "", strength: "", speed: "",durability: "", power: "", combat: ""),
            biography: biography?.toDomain() ?? Hero.Biography(fullName: "", alterEgos: "", aliases: [], placeOfBirth: "", firstAppearance: "", publisher: "", alignment: ""),
            appearance: appearance?.toDomain() ?? Hero.Appearance(gender: "", race: "", height: [], weight: [], eyeColor: "", hairColor: ""),
            work: work?.toDomain() ?? Hero.Work(occupation: "", base: ""),
            connections: connections?.toDomain() ?? Hero.Connections(groupAffiliation: "", relatives: "")
        )
    }
}

struct Powerstats: Decodable {
    let intelligence: String?
    let strength: String?
    let speed: String?
    let durability: String?
    let power: String?
    let combat: String?

    func toDomain() -> Hero.Powerstats {
        Hero.Powerstats(
            intelligence: intelligence ?? "",
            strength: strength ?? "",
            speed: speed ?? "",
            durability: durability ?? "",
            power: power ?? "",
            combat: combat ?? ""
        )
    }
}

struct Biography: Decodable {
    let fullName: String?
    let alterEgos: String?
    let aliases: [String]?
    let placeOfBirth: String?
    let firstAppearance: String?
    let publisher: String?
    let alignment: String?

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher
        case alignment
    }

    func toDomain() -> Hero.Biography {
        Hero.Biography(
            fullName: fullName ?? "",
            alterEgos: alterEgos ?? "",
            aliases: aliases ?? [],
            placeOfBirth: placeOfBirth ?? "",
            firstAppearance: firstAppearance ?? "",
            publisher: publisher ?? "",
            alignment: alignment ?? ""
        )
    }
}

struct Appearance: Decodable {
    let gender: String?
    let race: String?
    let height: [String]?
    let weight: [String]?
    let eyeColor: String?
    let hairColor: String?

    enum CodingKeys: String, CodingKey {
        case gender
        case race
        case height
        case weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }

    func toDomain() -> Hero.Appearance {
        Hero.Appearance(
            gender: gender ?? "",
            race: race ?? "",
            height: height ?? [],
            weight: weight ?? [],
            eyeColor: eyeColor ?? "",
            hairColor: hairColor ?? ""
        )
    }
}

struct Work: Decodable {
    let occupation: String?
    let base: String?

    func toDomain() -> Hero.Work {
        Hero.Work(
            occupation: occupation ?? "",
            base: base ?? ""
        )
    }
}

struct Connections: Decodable {
    let groupAffiliation: String?
    let relatives: String?

    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }

    func toDomain() -> Hero.Connections {
        Hero.Connections(
            groupAffiliation: groupAffiliation ?? "",
            relatives: relatives ?? ""
        )
    }
}

