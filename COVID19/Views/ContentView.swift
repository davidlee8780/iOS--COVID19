//
//  ContentView.swift
//  COVID19
//
//  Created by David Lee on 30/03/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var list = Network()
    
    var body: some View {
        
        VStack {
            List(list.countries, id: \.country) { country in
                HStack {
                    Text("\(country.country) -")
                    Text(" Casos: \(country.cases) -")
                    Text(" Mortes: \(country.deaths)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
