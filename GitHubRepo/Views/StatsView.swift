//
//  StatsView.swift
//  GitHubRepo
//
//  Created by user166196 on 3/22/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    var value: Float
    var progressColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(self.progressColor)
                    .animation(.linear)
            }.cornerRadius(5.0)
        }
    }
}

struct StatsView: View {
    @State var progress: Float = 0.0
    var stats: [PokeStat]
    var statsColor: Color
    
    func getResumeStat(stat: String) -> (String) {
        switch stat {
            case "hp":
                return "HP"
            case "attack":
                return "ATK"
            case "defense":
                return "DEF"
            case "speed":
                return "SPD "
            case "special-attack":
                return "SATK"
            case "special-defense":
                return "SDEF"
            default:
                return ""
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                ForEach(self.stats, id: \.self) { stat in
                    HStack {
                        Text(self.getResumeStat(stat: stat.stat.name))
                            .font(.caption)
                            .frame(width: 35, alignment: .leading)
                            .foregroundColor(self.statsColor)
                        ProgressBar(value: (Float(stat.base_stat) / 255), progressColor: self.statsColor).frame(height: 7)
                        Text(String(stat.base_stat)).frame(width: 35, alignment: .leading).font(.caption)
                    }
                }
            }
        }.padding(.horizontal, 20)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(stats: [PokeStat(base_stat: 0, stat: PokemonStat(name: "Forca"))], statsColor: Color.blue)
    }
}
