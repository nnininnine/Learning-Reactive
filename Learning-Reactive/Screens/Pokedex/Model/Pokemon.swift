//
//  Pokemon.swift
//  Learning-Reactive
//
//  Created by Nuttapon Buaban on 21/6/2565 BE.
//

import Foundation

typealias Pokemons = [Pokemon]
typealias PokemonAbilities = [PokemonAbility]
typealias NamedAPIResources = [NamedAPIResource]
typealias VersionGameIndices = [VersionGameIndex]
typealias PokemonHeldItemVersions = [PokemonHeldItemVersion]
typealias PokemonHeldItems = [PokemonHeldItem]
typealias PokemonMoveVersions = [PokemonMoveVersion]
typealias PokemonMoves = [PokemonMove]
typealias PokemonTypes = [PokemonType]
typealias PokemonTypePasts = [PokemonTypePast]
typealias PokemonStats = [PokemonStat]

struct Pokemon: Codable {
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let isDefault: Bool
    let order: Int
    let weight: Int
    let abilities: PokemonAbilities
    let forms: NamedAPIResources
    let gameIndices: VersionGameIndices
    let heldItems: PokemonHeldItems
    let locationAreaEncounters: String
    let moves: PokemonMoves
    let pastTypes: PokemonTypePasts
    let sprites: PokemonSprites
    let species: NamedAPIResource
    let stats: PokemonStats
    let types: PokemonTypes

    enum CodingKeys: String, CodingKey {
        case id, name
        case baseExperience = "base_experience"
        case height
        case isDefault = "is_default"
        case order, weight, abilities, forms
        case gameIndices = "game_indices"
        case heldItems = "held_items"
        case locationAreaEncounters = "location_area_encounters"
        case moves, species, sprites, stats, types
        case pastTypes = "past_types"
    }
}

struct PokemonAbility: Codable {
    let isHidden: Bool
    let slot: Int
    let ability: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot
        case ability
    }
}

struct PokemonHeldItem: Codable {
    let item: NamedAPIResource
    let versionDetails: PokemonHeldItemVersions

    enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }
}

struct PokemonHeldItemVersion: Codable {
    let version: NamedAPIResource
    let rarity: Int
}

struct PokemonMove: Codable {
    let move: NamedAPIResource
    let versionGroupDetails: PokemonMoveVersions

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

struct PokemonMoveVersion: Codable {
    let moveLearnMethod: NamedAPIResource
    let versionGroup: NamedAPIResource
    let levelLearnedAt: Int

    enum CodingKeys: String, CodingKey {
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
        case levelLearnedAt = "level_learned_at"
    }
}

struct PokemonTypePast: Codable {
    let generation: NamedAPIResource
    let types: PokemonTypes
}

struct PokemonType: Codable {
    let slot: Int
    let type: NamedAPIResource
}

struct PokemonSprites: Codable {
    let frontDefault: String
    let frontShiny: String
    let frontFemale: String
    let frontShinyFemale: String
    let backDefault: String
    let backShiny: String
    let backFemale: String
    let backShinyFemale: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontFemale = "front_female"
        case frontShinyFemale = "front_shiny_female"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backFemale = "back_female"
        case backShinyFemale = "back_shiny_female"
    }
}

struct PokemonStat: Codable {
    let stat: NamedAPIResource
    let effort: Int
    let baseStat: Int

    enum CodingKeys: String, CodingKey {
        case stat
        case effort
        case baseStat = "base_stat"
    }
}

struct VersionGameIndex: Codable {
    let gameIndex: Int
    let version: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

struct NamedAPIResource: Codable {
    let name: String
    let url: String
}
