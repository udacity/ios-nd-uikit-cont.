//
//  RPS
//  RockPaperScissors
//
//  Created by Jason on 11/14/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import Foundation

// MARK: - RPS: Comparable

enum RPS: Comparable {
    case Rock, Paper, Scissors

    init() {
        switch arc4random() % 3 {
        case 0:
            self = .Rock
        case 1:
            self = .Paper
        default:
            self = .Scissors
        }
    }
}

// MARK: - RPS (Comparison)

func <(lhs: RPS, rhs: RPS) -> Bool {
    
    switch (lhs, rhs) {
    case (.Rock, .Paper), (.Paper, .Scissors), (.Scissors, .Rock):
        return true
    default:
        return false
    }
}

// MARK: - RPS: CustomStringConvertible

extension RPS: CustomStringConvertible {
    
    var description: String {
        get {
            switch (self) {
            case .Rock:
                return "Rock"
            case .Paper:
                return "Paper"
            case .Scissors:
                return "Scissors"
            }
        }
    }
}
