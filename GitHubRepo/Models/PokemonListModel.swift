//
//  PokemonModel.swift
//  GitHubRepo
//
//  Created by user166196 on 3/11/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import Foundation

struct PokemonList: Decodable {
    var results: [PokemonListItem]
}

struct PokemonListItem: Decodable, Hashable {
    var name: String
    var url: String
}
