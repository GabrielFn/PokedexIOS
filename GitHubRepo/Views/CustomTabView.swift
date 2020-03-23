//
//  CustomPickerView.swift
//  GitHubRepo
//
//  Created by user166196 on 3/22/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selected: Int
    var tabs: [CustomTabModel]
    var selectedColor: Color
    
    func selectBackground(tag: Int) -> (Color) {
        self.selected == tag ? self.selectedColor : Color.white
    }
    
    func selectColor(tag: Int) -> (Color) {
        self.selected == tag ? Color.white : self.selectedColor
    }
    
    var body: some View {
        HStack {
            ForEach(self.tabs, id: \.self) { tab in
                Button(action: { self.selected = tab.tag }) {
                    Text(tab.label)
                }
                .font(.subheadline)
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .background(self.selectBackground(tag: tab.tag))
                .foregroundColor(self.selectColor(tag: tab.tag))
                .cornerRadius(15)
            }
        }
    }
}

struct CustomTabModel: Hashable {
    var label: String
    var tag: Int
}
