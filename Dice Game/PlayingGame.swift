//
//  PlayingGame.swift
//  Dice Game
//
//  Created by Dylan Koehler on 12/2/22.
//

import SwiftUI

struct PlayingGame: View {
    @State private var randomValue1 = 0
    @State private var randomValue2 = 0
    @State private var rotation = 0.0
    @State private var diceTotal = 0
    //@State private var points: [Int: Bool] = [1 : true, 2 : true, 3 : true, 4 : true, 5 : true, 6 : true, 7 : true, 8 : true, 9 : true, 10 : true]
    @State private var points: [Bool] = [true, true, true, true, true, true, true, true, true, true, true]
    @State private var testing = false
    @State private var disable = false
    @State private var score = 0
    @State private var highScore = 0
    @State private var winGame = false
    @State private var rolling = false
    @State var playersNumber = 0
    var body: some View {
        VStack {
            Spacer()
            Text("Shut the Box")
                .font(.title)
                .padding()
            HStack {
                Image("pips \(randomValue1)")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .rotationEffect(.degrees(rotation))
                    .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                    .padding()
                    .onTapGesture {
                        chooseRandom(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                            rotation += 360
                        }
                        disable = false
                    }
                    .disabled(diceTotal > 0)
                Spacer()
                VStack
                {
                    Text("Player \(playersNumber)'s High Score")
                        .underline()
                    Text("\(highScore)")
                        .padding()
                    Text("Dice Total")
                        .underline()
                    Text("\(diceTotal)")
                        .padding()
                }
                Spacer()
                Image("pips \(randomValue2)")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .rotationEffect(.degrees(rotation))
                    .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
                    .padding()
                    .onTapGesture {
                        chooseRandom(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                            rotation += 360
                        }
                    }
                    .disabled(diceTotal > 0)
            }
            HStack {
                ForEach(1..<11) { index in
                    Button("\(index)")
                    {
                        if diceTotal > 0
                        {
                            if score != 9
                            {
                                if diceTotal >= index
                                {
                                    diceTotal = diceTotal - index
                                    points[index] = false
                                    score = score + 1
                                    if score > highScore
                                    {
                                        highScore = score
                                    }
                                    if score == 10
                                    {
                                        //NavigationLink("You Win", destination: YouWin())
                                        //NavigationView<<#Content: View#>>(content: YouWin())
                                    }
                                }
                            }
                            if score == 9
                            {
                                if diceTotal == index
                                {
                                    diceTotal = diceTotal - index
                                    points[index] = false
                                    score = score + 1
                                }
                                if score > highScore
                                {
                                    highScore = score
                                }
                            }
                            if score == 10
                            {
                                //NavigationLink("", destination: YouWin())
                            }
                        }
                    }
                    .disabled(points[index] == false)
                    //.disabled(rolling == true)
                }
            }
            Button("Player Switch")
            {
                score = 0
                points = Array(repeating: true, count: points.count)
                diceTotal = 0
                playersNumber += 1
                //currentPlayer %= players.count
            }
            .padding()
        }
    }
    
    
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue1 = Int.random(in: 1...6)
                randomValue2 = Int.random(in: 1...6)
                chooseRandom(times: times - 1)
                diceTotal = randomValue1 + randomValue2
            }
        }
    }
}


struct PlayingGame_Previews: PreviewProvider {
    static var previews: some View {
        PlayingGame()
    }
}
