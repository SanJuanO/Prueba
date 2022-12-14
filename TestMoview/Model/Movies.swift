//
//  Moview.swift
//  Pruebas
//
//  Created by Macbook Pro on 11/09/22.
//

import Foundation

struct Moview: Decodable {
    let page: Int
    let results: [ResultMovies]

private enum CodingKeys: String, CodingKey {
    case page, results
}
}


struct ResultMovies: Decodable {
    let adult: Bool?
    let identifier: Int
    let backdroppath: String
    let originallanguage: String
    let overview: String
    let posterpath: String
    let releasedate: String?
    let voteaverage: Double
    let votecount: Int
    let popularity: Double
    let title: String?
    let video: Bool?
    let name: String?
    let firstairdate: String?

        
private enum CodingKeys: String, CodingKey {
    case backdroppath = "backdrop_path"
    case identifier = "id"
    case originallanguage = "original_language"
    case posterpath = "poster_path"
    case releasedate = "release_date"
    case voteaverage = "vote_average"
    case votecount = "vote_count"
    case firstairdate = "first_air_date"

    case adult, overview, popularity, title, video, name
}
}

struct Trailers: Decodable {
    let identifier: Int
    let results: [Movies]
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case results
    }
}

struct Movies: Decodable {
    let site: String
    let name: String
    let key: String

private enum CodingKeys: String, CodingKey {
    case name, key, site
}
}
