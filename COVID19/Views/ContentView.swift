//
//  ContentView.swift
//  COVID19
//
//  Created by David Lee on 30/03/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @ObservedObject var data = Network()
    
    func getCases() {
        if let dados = data.cases {
            print(dados)
        } else {
            print("Vazio")
        }
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 15) {
                    VStack {
                        Text("Date")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                            .onAppear {
                                self.getCases()
                        }
                    }
                    
                    Text("COVID19 - Total Case".uppercased())
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("432,243")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Button(action: {
                    //
                }) {
                    Image(systemName: "arrow.clockwise")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 18)
            .padding()
            .padding(.bottom, 30)
            .background(Color.red)
            
            Spacer()
            
            Listview()
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}
