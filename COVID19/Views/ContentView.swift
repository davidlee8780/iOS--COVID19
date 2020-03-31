//
//  ContentView.swift
//  COVID19
//
//  Created by David Lee on 30/03/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    
    @ObservedObject var list = Network()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                List {
                    ForEach(list.countries.filter {
                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { country in
                        HStack {
                            WebImage(url: URL(string: country.countryInfo.flag))
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("\(country.country) -")
                            Text(" Casos: \(country.cases) -")
                            Text(" Mortes: \(country.deaths)")
                        }
                    }
                }
            }
            .navigationBarTitle(Text("COVID-19"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
