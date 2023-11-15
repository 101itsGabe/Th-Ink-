//
//  MatchManager.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/26/23.
//

import Foundation
import SwiftUI
import GameKit


class MatchManager: NSObject, ObservableObject {
    @Published var authenticationState = PlayerAuthState.authenticating
    @Published var inGame = false
    @Published var isGameOver = false
    @Published var isGuessing = false
    @Published var isDrawing = false
    @Published var isMatchMaking = false
    
    @Published var currentlyDrawing = false
    @Published var curImage: UIImage?
    @Published var recivedImage: UIImage?
    @Published var curPath: Path?
    @Published var remainingTime = 30
    @Published var userGuess = ""
    @Published var playerDrawings: [GKPlayer: UIImage] = [:]
    
    var match: GKMatch?
    var players = [GKPlayer]()
    var localPlayer = GKLocalPlayer.local
    var playerUUIDKey = UUID().uuidString
    
    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
    
    
    func authenticateUser() {
        GKLocalPlayer.local.authenticateHandler = { [self] vc, e in
            if let viewController = vc {
                rootViewController?.present(viewController, animated: true)
                return
            }
            
            if let error = e {
                authenticationState = .error
                print(error.localizedDescription)
                return
            }
            
            
            if localPlayer.isAuthenticated {
                if localPlayer.isMultiplayerGamingRestricted{
                    authenticationState = .restricted
                }
                else{
                    authenticationState = .authenticated
                }
            } else {
                authenticationState = .unauthenticated
            }
        }
    }
    
    
    func pathToImage(){
        let uiImage = UIGraphicsImageRenderer(size: UIScreen.main.bounds.size).image { context in
            UIColor.clear.setFill()
            context.fill(UIScreen.main.bounds)
            
            UIColor.black.setStroke()
            if let uPath = curPath {
                let cgPath = uPath.cgPath
                context.cgContext.addPath(cgPath)
                context.cgContext.drawPath(using: .fillStroke)
            }
        }
        curImage = uiImage
    }
    
    func startMatchMaking(){
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 6

        let matchmakingVC = GKMatchmakerViewController(matchRequest: request)
        matchmakingVC?.matchmakerDelegate = self
        
        rootViewController?.present(matchmakingVC!   , animated: true)
    }
    
    
    func startGame(newMatch: GKMatch){
        match = newMatch
        match?.delegate = self
        if let unwrappedPlayers = match?.players {
            players = unwrappedPlayers
        }
        
        isMatchMaking = false
        isDrawing = true
        sendString("began:\(playerUUIDKey)")
    }
    
}
