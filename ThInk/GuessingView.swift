//
//  GuessingView.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/26/23.
//

import SwiftUI

struct GuessingView: View {
    @ObservedObject var matchManager: MatchManager
    @State private var enteredText = ""
    var body: some View {
        VStack{
            if let uiImage = matchManager.recivedImage{
                let image = Image(uiImage: uiImage)
                    image
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                        .border(.black)
                }
            
        TextField("Enter your guess...", text: $enteredText)
            .padding()
            .background(Color(.white))
            .border(Color(.black))
        Button{
            matchManager.userGuess = enteredText
            matchManager.isGuessing = false
        } label: {
            Text("Submit Guess")
                .foregroundColor(.black)
        }.foregroundColor(.black)
        }
        .padding()
        .background(Color(.white))
    }
}

#Preview {
    GuessingView(matchManager: MatchManager())
}
