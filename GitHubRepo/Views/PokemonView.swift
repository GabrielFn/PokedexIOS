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
                
                LinearGradient(gradient: Gradient(colors: [pokemonVM.pokemonColor, pokemonVM.pokemonColor, .white, .white, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                ScrollView(.vertical) {
                    VStack {
                        VStack {
                            Image(uiImage: UIImage(data: self.pokemonVM.pokemonImage) ?? UIImage())
                                .resizable()
                                .frame(width: 150.0)
                                .frame(height: 150.0)
                                .aspectRatio(contentMode: .fit)
                        }.offset(y: 70).zIndex(2)
                            
                        VStack {
                            HStack{ Spacer() }.padding(.top, 60)
                            Text(self.pokemonVM.pokemon.name.capitalized).font(.largeTitle)
                                            
                            HStack {
                                Text("Height: \(self.pokemonVM.pokemon.height)m").font(.caption)
                                Text("Weight: \(self.pokemonVM.pokemon.weight)kg").font(.caption)
                            }.padding(.top, 7)
                                            
                            HStack {
                                ForEach(self.pokemonVM.pokemon.types, id: \.self) { pokeType in
                                    Text(pokeType.type.name.capitalized)
                                        .font(.caption)
                                        .padding(.horizontal, 7)
                                        .padding(.vertical, 5)
                                        .background(getPokemonTypeColor(pokemonType: pokeType.type.name))
                                        .cornerRadius(10)
                                }
                            }.padding(.top, 10)
                                            
                            CustomTabView(selected: self.$selectedTab, tabs: self.tabsModel, selectedColor: self.pokemonVM.pokemonColor)
                                .padding(.top, 25)
                                            
                            if self.selectedTab == 0 {
                                StatsView(stats: self.pokemonVM.pokemon.stats, statsColor: self.pokemonVM.pokemonColor).padding(.top, 15)
                            } else if self.selectedTab == 1 {
                                Text("Evolucoes")
                            } else if self.selectedTab == 2 {
                                MovesListView(moves: self.pokemonVM.pokemon.moves).padding(.top, 15)
                            }
                                            
                            Spacer()
                        }
                        .background(Color.white)
                        .cornerRadius(radius: 40, corners: [.topRight, .topLeft])
                        .edgesIgnoringSafeArea(.bottom)
                    }
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
