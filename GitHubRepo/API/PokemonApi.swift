//
//  PokemonApi.swift
//  GitHubRepo
//
//  Created by user166196 on 3/11/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import Foundation

class API {
    private var baseURL = "https://pokeapi.co/api/v2"
    
    func getPokemons(completion: @escaping (PokemonList?) -> ()) {
        let url = URL(string: "\(baseURL)/pokemon?limit=151")
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let pokemonList = try? JSONDecoder().decode(PokemonList.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList)
            }
        }.resume()
    }
    
    func getPokemon(pokemonUrl: String, completion: @escaping (Pokemon?) -> ()) {
        guard let url = URL(string: pokemonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemon)
            }
        }.resume()
    }
    
    func getPokemonImage(pokemonId id:Int, completion: @escaping (Data) -> ()) {
        guard let url = URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(String(id)).png") else { return }
            
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
                
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
}
