//
//  ContentView.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var matchManager: MatchManager
    var body: some View {
        ZStack {
            if(matchManager.isDrawing){
                GameView(matchManager: matchManager)
            }
            else if (matchManager.isGuessing){
                GuessingView(matchManager: matchManager)
            }
            else if(matchManager.isMatchMaking){
                MatchView(matchManager: matchManager)
            }
            else{
                MainMenu(matchManager: matchManager)
            }
        }.onAppear{
            matchManager.authenticateUser()
        }
    }
}

#Preview {
    ContentView(matchManager: MatchManager())
}
