//
//  MovesListView.swift
//  GitHubRepo
//
//  Created by user166196 on 3/23/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import SwiftUI

struct MovesListView: View {
    var moves: [PokeMove]
    
    func formatTextMove(name: String) -> (String) {
        if (name.contains("-")) {
            return name.replacingOccurrences(of: "-", with: " ").capitalized
        }
        
        return name
    }
    
    var body: some View {
        ForEach(self.moves, id: \.self) { move in
            Text(self.formatTextMove(name: move.move.name.capitalized))
        }
    }
}

struct MovesListView_Previews: PreviewProvider {
    static var previews: some View {
        MovesListView(moves: [])
    }
}
