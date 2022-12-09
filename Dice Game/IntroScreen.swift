//
//  IntroScreen.swift
//  Dice Game
//
//  Created by Dylan Koehler on 11/22/22.
//

import SwiftUI

struct IntroScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Shut the Box Dice Game")
                    .font(.largeTitle)
                //NavigationLink(destination: "ContentView")
                //{
                    Text("Go to the Game")
                
            }
        }
    }
}

struct IntroScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreen()
    }
}
