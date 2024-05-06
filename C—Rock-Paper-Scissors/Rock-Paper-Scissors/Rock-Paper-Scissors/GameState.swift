//
//  GameState.swift
//  Rock-Paper-Scissors
//
//  Created by Declan Wallace on 5/6/24.
//

import Foundation

enum GameState {
    case start
    case win
    case lose
    case draw
}

func randomSign() -> Sign {
    let signIndex = Int.random(in: 0...2)
    switch signIndex {
    case 0:
        return .rock
    case 1:
        return .paper
    default:
        return .scissors
    }
}

extension Sign {
    func compare(with opponent: Sign) -> GameState {
        switch (self, opponent) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return .lose
        default:
            return .draw
        }
    }
}

