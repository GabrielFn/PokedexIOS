//
//  PokemonTypeColor.swift
//  GitHubRepo
//
//  Created by user166196 on 3/20/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import Foundation
import SwiftUI

func getPokemonTypeColor(pokemonType type:String) -> Color {
    switch type {
    case "grass":
        return Color(UIColor(red: 0.4784, green: 0.7804, blue: 0.298, alpha: 1.0))
    case "fire":
        return Color(UIColor(red: 0.9333, green: 0.5059, blue: 0.1882, alpha: 1.0))
    case "poison":
        return Color.purple
    case "water":
        return Color.blue
    case "bug":
        return Color(UIColor(red: 0.651, green: 0.7255, blue: 0.102, alpha: 1.0))
    case "fairy":
        return Color(UIColor(red: 0.8392, green: 0.5216, blue: 0.6784, alpha: 1.0))
    case "ground":
        return Color(UIColor(red: 0.8863, green: 0.749, blue: 0.3961, alpha: 1.0))
    case "flying":
        return Color(UIColor(red: 0.6627, green: 0.5608, blue: 0.9529, alpha: 1.0))
    case "electric":
        return Color(UIColor(red: 0.9686, green: 0.8157, blue: 0.1725, alpha: 1.0))
    case "fighting":
        return Color(UIColor(red: 0.7608, green: 0.1804, blue: 0.1569, alpha: 1.0))
    case "psychic":
        return Color(UIColor(red: 0.9765, green: 0.3333, blue: 0.5294, alpha: 1.0))
    case "rock":
        return Color(UIColor(red: 0.7137, green: 0.6314, blue: 0.2118, alpha: 1.0))
    case "steel":
        return Color(UIColor(red: 0.7176, green: 0.7176, blue: 0.8078, alpha: 1.0))
    case "ice":
        return Color(UIColor(red: 0.5882, green: 0.851, blue: 0.8392, alpha: 1.0))
    case "ghost":
        return Color(UIColor(red: 0.451, green: 0.3412, blue: 0.5922, alpha: 1.0))
    case "dragon":
        return Color(UIColor(red: 0.4353, green: 0.2078, blue: 0.9882, alpha: 1.0))
    default:
        return Color.gray
    }
}
