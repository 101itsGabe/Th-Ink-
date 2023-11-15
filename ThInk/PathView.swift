//
//  PathView.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/25/23.
//

import Foundation
import SwiftUI

struct PathView: View{
    var path: Path
    
    var body: some View{
        path.stroke(Color.black, lineWidth: 2)
    }
}
