//
//  Instructions.swift
//  Dice Game
//
//  Created by Dylan Koehler on 12/6/22.
//

import SwiftUI

struct Instructions: View {
    var body: some View {
        Text("How to play Shut the Box")
            .font(.title)
            .padding()
        Text("      Shut the Box is a game played with 2 dice and the goal is to use up every number between 1-10.  Normally when you use a number you would shut it down until every number was down and the box was shut.  To play every turn you roll both dice and the dice total that you roll is the amount of points you can work with for that turn.  You complete a turn when you put down a total adding up to your dice total.")
            .padding()
        Text("      Every number that you select will add one point to your point total with the most points you can earn being 10")
            .padding()
        Text("      To win the game you need to use all the numbers eventually ending with the exact number matching the final dice total.  The game will go on until there is a winner")
            .padding()
    }
}

struct Instructions_Previews: PreviewProvider {
    static var previews: some View {
        Instructions()
    }
}
