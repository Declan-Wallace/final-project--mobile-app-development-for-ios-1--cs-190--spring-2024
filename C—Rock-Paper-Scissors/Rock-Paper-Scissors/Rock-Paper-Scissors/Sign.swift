//
//  Sign.swift
//  Rock-Paper-Scissors
//
//  Created by Declan Wallace on 5/6/24.
//

import Foundation

enum Sign: String {
    case rock = "👊"
    case paper = "✋"
    case scissors = "✌️"
    
    var emoji: String {
        return self.rawValue
    }
}
