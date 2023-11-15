//
//  DrawingView.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/25/23.
//

import Foundation
import SwiftUI
import PencilKit

struct DrawingView: View{
    @State private var points = [CGPoint]()
    @State private var path = Path()
    @State private var lastPoint: CGPoint? = nil
    @State private var firstPoint: CGPoint? = nil
    @ObservedObject var matchManager: MatchManager
    @State private var eraser = false
    var body: some View{
        GeometryReader { geo in
            VStack{
                PathView(path: path)
                //.frame(width:300, height: 300)
                    
                    .background(Color(red: 153, green: 147, blue: 142))
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged{value in
                                let touchPoint = value.location
                                points.append(touchPoint)
                                if(isPointInBounds(touchPoint, frame: geo.frame(in: .local))){
                                    if(path.isEmpty || lastPoint == nil || self.distance(lastPoint!, touchPoint) >= 80){
                                        path.move(to:touchPoint)
                                        firstPoint = touchPoint
                                    }
                                    else{
                                        path.addLine(to: touchPoint)
                                    }
                                    lastPoint = touchPoint
                                }
                            }
                            .onEnded{ _ in
                                lastPoint = nil
                            }
                    )
                    .border(Color.black, width: 15)
                    .cornerRadius(10)

                HStack{
                    Button{
                        points.removeAll()
                        path = Path()
                        lastPoint = nil
                    } label: {
                        Text("Clear Canvas")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(
                        Capsule(style: .circular)
                            .foregroundColor(.black))
                    Button{
                        if(!points.isEmpty){
                            print(points.count)
                            var prevpoint: CGPoint? = nil
                                while(points.last != firstPoint){
                                    if(!points.isEmpty){
                                        points.removeLast()
                                    }
                                }
                            points.removeLast()
                            path = Path{path in
                                for p in points{
                                    if p == points.first{
                                        path.move(to: p)
                                        prevpoint = p
                                    }
                                    else if let unwrappedPrevPoint = prevpoint, distance(p, unwrappedPrevPoint) <= 100{
                                        path.addLine(to: p)
                                    }
                                    else{
                                        path.move(to: p)
                                    }
                                    prevpoint = p
                                }
                            }
                            print(points.count)
                        }
                    } label: {
                        Text("Undo Once")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(
                        Capsule(style: .circular)
                            .foregroundColor(.black))
                }
            }
        }
        
        .onChange(of: matchManager.remainingTime) { newValue in
                    if newValue <= 0 {
                        setPath() // This will be called when remainingTime reaches zero
                        matchManager.isDrawing = false
                        matchManager.isGuessing = true
                        matchManager.finishedDrawing()
                    }
                }

    }
    
    
    
    private func isPointInBounds(_ point: CGPoint, frame: CGRect) -> Bool {
        return frame.contains(point)
    }
    
    private func distance(_ p1: CGPoint, _ p2:CGPoint) -> CGFloat {
        let xDist = p2.x - p1.x
        let yDist = p2.y - p1.y
        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
    }

    
    private func setPath(){
        matchManager.curPath = path
    }
}
