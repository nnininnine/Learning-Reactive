//
//  Constants.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import Foundation

enum ThaiDigit: String, CaseIterable {
    case ZERO = "๐"
    case ONE = "๑"
    case TWO = "๒"
    case THREE = "๓"
    case FOUR = "๔"
    case Five = "๕"
    case SIX = "๖"
    case SEVEN = "๗"
    case EIGHT = "๘"
    case NINE = "๙"
}

enum PokedexConstants {
    static let baseURL: String = "https://pokeapi.co/api/v2"
    static let pokemonEndpoint: String = "/pokemon"
}
