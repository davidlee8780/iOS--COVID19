//
//  Listview.swift
//  COVID19
//
//  Created by David Lee on 31/03/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import SwiftUI

struct Listview: View {
    
    @State private var searchText = ""
    
    @ObservedObject var list = Network()
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText, placeholder: "Search Country...")
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(list.countries.filter {
                    self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText.lowercased())
                }, id: \.country) { country in
                    CellView(country: country)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                        }
                }
                .padding()
                .frame(width: 350)
            }
        }
    .padding()
    }
}

struct Listview_Previews: PreviewProvider {
    static var previews: some View {
        Listview()
    }
}
