//
//  MenuViewModel.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import Foundation

final class MenuViewModel {
    
    // Lokalized
    
    let titleTextKey = "app.name"
    let subtitleTextKey = "menu.level.title"
    
    // Public
    
    func randomImageId() -> String {
        return "card-\(Int.random(in: 1...15))"
    }
    
}
