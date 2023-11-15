//
//  Misc.swift
//  ThInk
//
//  Created by Gabriel Mannheimer on 10/26/23.
//

import Foundation

let telestrationsMix = [
    "Surfing", "Beach", "Kite",
    "Birthday", "Candles", "Dancing",
    "Rain", "Picnic", "Park",
    "Rollercoaster", "Sandcastle", "Camping",
    "Stars", "Scuba diving", "Ocean",
    "Hide and seek", "Haunted house", "Cookies",
    "Scratch", "Rock climbing", "Mountain",
    "Hot air balloon", "Snowball fight", "Treasure hunt",
    "Garden", "Hopscotch", "Pirate ship",
    "Ice skating", "Frozen pond", "Tea party",
    "Snowman", "Masterpiece", "Frisbee",
    "Safari", "Karaoke", "Chess",
    "Marathon", "Road trip", "Guitar",
    "Dolphin", "Astronaut", "Robot",
    "Unicorn", "Rainbow", "Rocket",
    "Banana", "Circus", "Elephant",
    "Superhero", "Wizard", "Dragon",
    "Castle", "Surfing at the beach", "Flying a kite",
    "Birthday cake with candles", "Dancing in the rain", "Picnic in the park",
    "Rollercoaster ride", "Building a sandcastle", "Camping under the stars",
    "Scuba diving in the ocean", "Playing hide and seek", "Exploring a haunted house",
    "Baking cookies from scratch", "Rock climbing on a mountain", "Riding a hot air balloon",
    "Having a snowball fight", "Going on a treasure hunt", "Planting a garden",
    "Playing hopscotch", "Sailing on a pirate ship", "Ice skating on a frozen pond",
    "Having a tea party", "Building a snowman", "Painting a masterpiece",
    "Playing catch with a frisbee", "Going on a safari", "Riding a roller coaster",
    "Karaoke night with friends", "Playing a game of chess", "Running a marathon",
    "Going on a road trip"
]


enum PlayerAuthState: String {
    case authenticating = "Logging in to Game Center..."
    case unauthenticated = "Please sign in to Game Center to play"
    case authenticated = ""
    
    case error = "There was an error logging into Game Center"
    case restricted = "You're not allowed to play mulitplayer games!"
}

struct PastGuess: Identifiable {
    let id = UUID()
    var message: String
}



