//
//  DifficultyLevel.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import Foundation

enum DifficultyLevel: String, CaseIterable {
    case easy, medium, hard
    
    var nameKey: String {
        return "menu.level." + self.rawValue
    }
    
    var boadSize: (row: Int, column: Int) {
        switch self {
        case .easy:
            return (4, 4)
        case .medium:
            return (6, 4)
        case .hard:
            return (6, 5)
        }
    }
}
