//
//  YouWin.swift
//  Dice Game
//
//  Created by Dylan Koehler on 11/22/22.
//

import SwiftUI

struct YouWin: View {
    let pNumber: Int
    var body: some View {
        Text("Congratulations player \(pNumber) Wins")
            .font(.title)
            .fontWeight(.bold)
    }
}

struct YouWin_Previews: PreviewProvider {
    static var previews: some View {
        YouWin(pNumber: 1)
    }
}
