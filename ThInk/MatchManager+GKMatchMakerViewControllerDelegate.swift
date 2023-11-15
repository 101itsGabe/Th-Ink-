//
//  MatchManager+GKMatchMakerViewControllerDelegate.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 11/2/23.
//

import Foundation
import GameKit

extension MatchManager: GKMatchmakerViewControllerDelegate{
    
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        viewController.dismiss(animated: true)
        print("starting match")
        startGame(newMatch: match)
    }
     
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        print("inside error match maker")
        print(error)
        viewController.dismiss(animated: true)
    }
    
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true)
        print("cancelled")
    }
    
}
