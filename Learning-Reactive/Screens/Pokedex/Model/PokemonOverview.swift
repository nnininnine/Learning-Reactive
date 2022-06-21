//
//  PokemonOverview.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 21/6/2565 BE.
//

import Foundation

typealias PokemonResults = [PokemonResult]

struct PokemonOverview: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: PokemonResults
}

struct PokemonResult: Codable {
    let name: String
    let url: String
}
