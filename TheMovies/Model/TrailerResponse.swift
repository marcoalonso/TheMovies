//
//  TrailerResponse.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 23/06/23.
//

import Foundation

struct TrailerResponse: Codable {
    let id: Int
    let results: [Trailer]
}

struct Trailer: Codable {
    let key: String
}
