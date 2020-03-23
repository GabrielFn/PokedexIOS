//
//  PokemonModel.swift
//  GitHubRepo
//
//  Created by user166196 on 3/19/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {
    var id: Int
    var name: String
    var types: [PokeType]
    var stats: [PokeStat]
    var height: Int
    var weight: Int
}

struct PokeType: Decodable, Hashable {
    var slot: Int
    var type: PokemonType
}

struct PokeStat: Decodable, Hashable {
    var base_stat: Int
    var stat: PokemonStat
}

struct PokemonType: Decodable, Hashable {
    var name: String
    var url: String
}

struct PokemonStat: Decodable, Hashable {
    var name: String
}
