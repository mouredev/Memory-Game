//
//  Card.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import Foundation

class Card: ObservableObject {
    
    let uuid = UUID().uuidString
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    @Published var flipped = false
    @Published var matched = false
}
