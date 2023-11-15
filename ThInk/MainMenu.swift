//
//  MainMenu.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/26/23.
//

import SwiftUI

struct MainMenu: View {
    @State private var goToContentView = false
    @State private var capturedImage: UIImage? = nil
    @ObservedObject var matchManager: MatchManager
    
    var body: some View{
        NavigationView{
            VStack{
                Spacer().frame(height: 80)
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .padding(20)
                
                Spacer()
                        
                Button {
                    //ToDo Start The Match
                         matchManager.isMatchMaking = true;
                } label: {
                    Text("PLAY")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                }/*
                .disabled(matchManager.authenticationState != .authenticated ||
                          matchManager.inGame)
                  */
                .padding(.vertical, 20)
                .padding(.horizontal,100)
                .background(
                    Capsule(style: .circular)
                        .foregroundColor(.black)
                )
                         
                
                Text(matchManager.authenticationState.rawValue)
                    .font(.headline.weight(.semibold))
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
            }.background(
            Image("Mainmenubg")
            )
        }
    }
        
}

#Preview {
    MainMenu(matchManager: MatchManager())
}
