//
//  Players.swift
//  Dice Game
//
//  Created by Dylan Koehler on 12/6/22.
//

import SwiftUI

struct Players: View {
    @State private var playersNumber = 0
    @State private var playerSelect = true
    @State private var players = [0, 1, 2, 3, 4]
    var body: some View {
        //NavigationView {
        VStack {
            Text("Player Select")
                .font(.title)
            Text("How many players will there be?")
                .padding()
            HStack {
                ForEach(1..<5) { index in
                    Button("\(index)")
                    {
                        playerSelect = false
                        playersNumber = players[index]
                    }
                }
                .disabled(playerSelect == false)
                Text("\(playersNumber)")
            }
                Text("You have \(playersNumber) players")
                .padding()
            if playerSelect == false
            {
                NavigationLink("Play Game", destination: PlayingGame())
                    .padding()
            }
        }
    }
}
    struct Players_Previews: PreviewProvider {
        static var previews: some View {
            Players()
        }
    }
