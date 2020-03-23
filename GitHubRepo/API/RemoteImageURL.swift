//
//  RemoteImageURL.swift
//  GitHubRepo
//
//  Created by user166196 on 3/19/20.
//  Copyright © 2020 user166196. All rights reserved.
//

import Foundation

class RemoteImageURL: ObservableObject {
    @Published var dataIsValid = false
    var data: Data?
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
                self.dataIsValid = true
                print(response?.url as Any)
            }
        }.resume()
    }
}
