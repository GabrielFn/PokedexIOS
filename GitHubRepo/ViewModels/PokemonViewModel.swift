//
//  PokemonViewModel.swift
//  GitHubRepo
//
//  Created by user166196 on 3/19/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject, Identifiable {
    var api = API()
    
    @Published var pokemon = Pokemon(id: 0, name: "", types: [], stats: [], height: 0, weight: 0) {
        didSet {
            if (self.pokemon.id != 0) {
                fetchPokemonImage(pokemonId: self.pokemon.id)
            }
        }
    }
    @Published var pokemonImage: Data = Data()
    @Published var pokemonColor: Color = Color.gray

    init(pokemonUrl url: String) {
        fetchPokemon(pokemonUrl: url)
    }
    
    func fetchPokemon(pokemonUrl url: String) {
        api.getPokemon(pokemonUrl: url) { result in
            let resultSorted = result?.types.sorted {
                $0.slot < $1.slot
            }
            
            self.pokemon = result ?? Pokemon(id: 0, name: "", types: [], stats: [], height: 0, weight: 0)
            self.pokemon.types = resultSorted!
            self.pokemonColor = getPokemonTypeColor(pokemonType: self.pokemon.types.first!.type.name)
        }
    }
    
    func fetchPokemonImage(pokemonId id: Int) {
        api.getPokemonImage(pokemonId: id) { result in
            self.pokemonImage = result
        }
    }
}
