//
//  PokemonViewModel.swift
//  GitHubRepo
//
//  Created by user166196 on 3/11/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import Foundation
import Combine

class PokemonListViewModel: ObservableObject, Identifiable {
    var api = API()
    
    @Published var pokemonListFiltered: [PokemonListItem] = []
    @Published var pokemonTerm = "" {
        didSet {
            if (!pokemonTerm.isEmpty) {
                self.pokemonListFiltered = self.pokemonList.results.filter { $0.name.uppercased().contains(self.pokemonTerm.uppercased()) }
            } else {
                self.pokemonListFiltered = self.pokemonList.results
            }
        }
    }
    
    var pokemonList = PokemonList(results: []) {
        didSet {
            self.pokemonListFiltered = self.pokemonList.results
        }
    }
    
    init() {
        fetchPokemons()
    }
    
    func fetchPokemons() {
        api.getPokemons() { result in
            self.pokemonList = result ?? PokemonList(results: [])
        }
    }
}
