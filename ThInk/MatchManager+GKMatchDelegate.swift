//
//  MatchManager+GKMatchDelegate.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 11/2/23.
//

import Foundation
import GameKit
import UIKit
import SwiftUI

extension MatchManager: GKMatchDelegate{
    func match(_ match: GKMatch, didReceive data: Data, fromRemotePlayer player: GKPlayer) {
        if let image = UIImage(data: data), image.size.width > 0, image.size.height > 0{
            recivedImage = image
        }
        else
        {
            print("Something went wrong")
        }
    }
    
    
    func sendString(_ message: String){
        guard let encoded = "strData:\(message)".data(using: .utf8) else {return}
        //sendData(data, mode: .reliable)
    }
    
    func finishedDrawing() {
        if let drawingData = curImage?.pngData() {
            let curIndex = players.firstIndex(of: localPlayer) ?? 0
            let nextIndex = (curIndex + 1) % players.count
            
            let nextPlayer = players[nextIndex]
            sendData(drawingData, to: nextPlayer, mode: .reliable)
        }
    }
     
     
    
    
    func sendData(_ data: Data, to player: GKPlayer, mode: GKMatch.SendDataMode){
        do{
            try match?.send(data, to: [player], dataMode: mode)
        }catch{
            print(error)
        }
    }
    
    
/*
    func match(_ match: GKMatch, player: GKPlayer, didChange state: GKPlayerConnectionState) {
        <#code#>
    }
 */
     
}
