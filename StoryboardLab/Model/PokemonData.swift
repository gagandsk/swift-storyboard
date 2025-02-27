//
//  PokemonData.swift
//  StoryboardLab
//
//  Created by Gagandeep Dass Kaur on 27/2/25.
//

import Foundation

struct PokemonData: Codable {
    let results: [Result]?
}
//al ser de una api, los ponemos como opcionales ('?')
struct Result: Codable {
    let name: String?
    let url: String?
}
