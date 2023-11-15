//
//  RandomPhraseView.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/25/23.
//

import Foundation
import SwiftUI

struct RandomPhraseView: View{
    let randomPhrases = telestrationsMix
    var randomPhrase: String {
        return  randomPhrases.randomElement() ?? "Unknown Object"
        }
    var body: some View{
        Text("Draw \(randomPhrase)")
            .font(.system(size: 45))
            .foregroundColor(.black)
            .bold()
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
