//
//  GameView.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/26/23.
//

import SwiftUI

struct GameView: View {
    @StateObject var matchManager = MatchManager()
    @State private var randomCheck = true // checks if it shows a random phrase or previous answer
    var body: some View {
        VStack{
            CountdownView(matchManager: matchManager)
            if(randomCheck){
                RandomPhraseView()
            }
            else{
                Text(matchManager.userGuess)
            }
            DrawingView(matchManager: matchManager)
        }.padding()
            .background(
                Image("drawbg")
            )
    }
}

#Preview {
    GameView()
}
