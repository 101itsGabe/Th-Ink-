//
//  CountdownView.swift
//  CountdownView.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/25/23.
//

import Foundation
import SwiftUI

struct CountdownView: View{
    @State private var remainingTime = 30
    @State private var timer: Timer? = nil
    @State private var finished = false
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
            VStack {
                Text("Time Remaining: \(remainingTime)s")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding()
                    .onAppear(){
                        startTimer()
                    }

                NavigationLink(destination: GuessingView(matchManager: MatchManager()), isActive: $finished){}
                        .navigationBarBackButtonHidden(true)
                }
            }
    
    
    
    private func startTimer(){
        remainingTime = 30
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            if remainingTime > 0 {
                remainingTime -= 1
            }
            else {
                timer?.invalidate()
                finished = true;
                matchManager.pathToImage()
            }
            matchManager.remainingTime = remainingTime
        }
    }
    
}
