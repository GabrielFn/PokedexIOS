//
//  CustomNavigationView.swift
//  GitHubRepo
//
//  Created by user166196 on 3/21/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import SwiftUI

struct CustomNavigationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var title: String = ""
    var color: Color? = nil
    
    init(navigationTitle title:String, navigationColor color:Color?) {
        self.title = title
        self.color = color
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                    Image(systemName: "chevron.left").padding(.trailing, 10)
                    Text(title.capitalized)
                }
                
                Spacer()
            }.padding().foregroundColor((self.color != nil) ? self.color : Color.blue)
            
            Spacer()
        }
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(navigationTitle: "Title", navigationColor: Color.black)
    }
}
