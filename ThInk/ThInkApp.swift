//
//  ThInkApp.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/25/23.
//

import SwiftUI

@main
struct ThInkApp: App {
    var body: some Scene {
        WindowGroup {
           ContentView(matchManager: MatchManager())
        }
    }
}
