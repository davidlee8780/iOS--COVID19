//
//  DataFetcher.swift
//  COVID19
//
//  Created by David Lee on 30/03/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import Foundation
import Combine

class Network: ObservableObject {
    
    @Published var countries = [Country]()
    
    init() {
        load()
    }
    
    func load() {
        guard let url = URL(string: "https://corona.lmao.ninja/countries") else {
            print("URL not found")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            let jsonDecoder = JSONDecoder()
            
            if let d = data {
                do {
                    let lists = try jsonDecoder.decode([Country].self, from: d)
                    DispatchQueue.main.async {                        
                        self.countries = lists
                    }
                } catch {
                    print(err?.localizedDescription ?? "Error")
                }
            }
        }.resume()
    }
}
