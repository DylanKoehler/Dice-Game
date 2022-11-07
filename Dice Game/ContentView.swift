//
//  ContentView.swift
//  Roll the Dice
//
//  Created by Dylan Koehler on 11/07/22
//

import SwiftUI

struct ContentView: View {
    @State private var randomValue1 = 0
    @State private var randomValue2 = 0
    @State private var rotation = 0.0
    var body: some View {
        VStack {
            Text("Dice Roll")
                .font(.title)
                .padding()
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
                }
            Spacer()
        }
        VStack {
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
            Spacer()
        }
    }
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue1 = Int.random(in: 1...6)
                randomValue2 = Int.random(in: 1...6)
                chooseRandom(times: times - 1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

