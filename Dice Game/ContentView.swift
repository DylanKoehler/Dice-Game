//
//  ContentView.swift
//  Roll the Dice
//
//  Created by Dylan Koehler on 11/07/22
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Shut the Box")
                    .padding()
                    .font(.title)
                NavigationLink("Instructions", destination: Instructions())
                    .padding()
                    
                //.disabled(players.isEmpty)
                NavigationLink("Player Select", destination: Players())
                    .padding()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

