//
//  ImageView.swift
//  GitHubRepo
//
//  Created by user166196 on 3/19/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import SwiftUI

struct PokemonListItemView: View {
    @ObservedObject var pokemonVM: PokemonViewModel
    @State var selected: Bool = false
    
    init(pokemonUrl url:String) {
        self.pokemonVM = PokemonViewModel(pokemonUrl: url)
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: PokemonView(pokemonViewModel: pokemonVM), isActive: $selected) { EmptyView() }.foregroundColor(Color.white)
            HStack {
                Image(uiImage: UIImage(data: pokemonVM.pokemonImage) ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:60, height: 60)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("#\(String(pokemonVM.pokemon.id))").foregroundColor(Color.gray)
                        Text(pokemonVM.pokemon.name.capitalized)
                    }
                    
                    Spacer()
                    
                    HStack {
                        ForEach(pokemonVM.pokemon.types, id: \.self) { pokeType in
                            Text(pokeType.type.name.capitalized)
                                .font(.caption)
                                .padding(.horizontal, 7)
                                .padding(.vertical, 5)
                                .background(getPokemonTypeColor(pokemonType: pokeType.type.name))
                                .cornerRadius(15)
                        }
                    }
                }
            }.onTapGesture { self.selected = true }
        }
    }
}
