//
//  ContentView.swift
//  GitHubRepo
//
//  Created by user166196 on 3/10/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import SwiftUI

struct PokemonListView: View {
    @ObservedObject var pokemonListVM = PokemonListViewModel()
    
    var body: some View {
        NavigationView() {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search", text: $pokemonListVM.pokemonTerm)
                }
                .padding(7)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.gray))
                .padding(.horizontal, 20)
                
                List(pokemonListVM.pokemonListFiltered, id: \.self) { pokemon in
                    PokemonListItemView(pokemonUrl: pokemon.url)
                }
            }
            .navigationBarTitle(Text("Pokemons"))
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
