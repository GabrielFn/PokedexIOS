//
//  PokemonView.swift
//  GitHubRepo
//
//  Created by user166196 on 3/20/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import SwiftUI

struct PokemonView: View {
    private var pokemonVM: PokemonViewModel
    private var tabsModel: [CustomTabModel] = [
        CustomTabModel(label: "ESTATISTICAS", tag: 0),
        CustomTabModel(label: "EVOLUCOES", tag: 1),
        CustomTabModel(label: "MOVIMENTOS", tag: 2)
    ]
    
    @State private var selectedTab: Int = 0
    
    init(pokemonViewModel pokemonVM: PokemonViewModel) {
        self.pokemonVM = pokemonVM
    }
    
    var body: some View {
            ZStack {
                NavigationView {
                    Text("")
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                pokemonVM.pokemonColor.edgesIgnoringSafeArea(.all)

                VStack {
                    Image(uiImage: UIImage(data: pokemonVM.pokemonImage) ?? UIImage())
                        .resizable()
                        .frame(width: 150.0)
                        .frame(height: 150.0)
                        .padding(.top, 30)
                        .aspectRatio(contentMode: .fit)
                        .offset(y: 70)
                        .zIndex(1)
                    
                    VStack {
                        HStack { Spacer() }.padding(.top, 60)
                        Text(pokemonVM.pokemon.name.capitalized).font(.largeTitle)
                        
                        HStack {
                            Text("Height: \(pokemonVM.pokemon.height)m").font(.caption)
                            Text("Weight: \(pokemonVM.pokemon.weight)kg").font(.caption)
                        }.padding(.top, 7)
                        
                        HStack {
                            ForEach(pokemonVM.pokemon.types, id: \.self) { pokeType in
                                Text(pokeType.type.name.capitalized)
                                    .font(.caption)
                                    .padding(.horizontal, 7)
                                    .padding(.vertical, 5)
                                    .background(getPokemonTypeColor(pokemonType: pokeType.type.name))
                                    .cornerRadius(10)
                            }
                        }.padding(.top, 10)
                        
                        CustomTabView(selected: $selectedTab, tabs: self.tabsModel, selectedColor: pokemonVM.pokemonColor)
                            .padding(.top, 25)
                        
                        if selectedTab == 0 {
                            StatsView(stats: pokemonVM.pokemon.stats, statsColor: pokemonVM.pokemonColor).padding(.top, 15)
                        } else if selectedTab == 1 {
                            Text("Evolucoes")
                        } else if selectedTab == 2 {
                            Text("Movimentos")
                        }
                        
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(radius: 50, corners: [.topRight, .topLeft])
                    .shadow(color: Color.gray, radius: 3, x: 1, y: -1)
                    .edgesIgnoringSafeArea(.bottom)
                }
                
                CustomNavigationView(navigationTitle: "Voltar", navigationColor: Color.black)
            }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemonViewModel: PokemonViewModel(pokemonUrl: "https://pokeapi.co/api/v2/pokemon/1"))
    }
}
