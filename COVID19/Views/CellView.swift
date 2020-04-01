//
//  CellView.swift
//  COVID19
//
//  Created by David Lee on 31/03/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CellView: View {
    
    var country: Country
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 0) {
                WebImage(url: URL(string: country.countryInfo.flag))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                
                Text(country.country)
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding()
            
            VStack {
                VStack {
                    Text("Cases")
                    Text("\(country.cases)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.yellow)
                }
                
                Divider()
                
                VStack {
                    Text("Deaths")
                    Text("\(country.deaths)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                    
                }
                
                Divider()
                
                VStack {
                    Text("Recovered")
                    Text("\(country.recovered)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                }
                
                Divider()
                
                VStack {
                    Text("Date")
                    Text("\(update(time: country.updated))")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
            }
        }
    .padding()
    .background(
        Rectangle()
            .foregroundColor(.white)
            .cornerRadius(20)
        )
    }
    
    func update(time: Int) -> String {
        
        let date = Int(time / 1000)
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd - MMM - YYYY"

        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(exactly: date) ?? 00))
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(country: Country(country: "USA", cases: 321, deaths: 312, recovered: 321, updated: 1585658107437, countryInfo: CountryInfo(flag: "https://raw.githubusercontent.com/NovelCOVID/API/master/assets/flags/us.png")))
    }
}
