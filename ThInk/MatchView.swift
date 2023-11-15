//
//  MatchView.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 11/12/23.
//

import SwiftUI

struct MatchView: View {
    @ObservedObject var matchManager: MatchManager
    var body: some View {
        VStack{
            Text(matchManager.localPlayer.alias)
        }.background(Image("matchmaking")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
            .scaleEffect(8)
        )
        .onAppear{
            print("Starting Match Making")
            matchManager.startMatchMaking()
        }
    }
}

#Preview {
    MatchView(matchManager: MatchManager())
}
