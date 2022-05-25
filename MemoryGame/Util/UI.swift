//
//  UI.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import SwiftUI

extension CGFloat {
    
    // Size
    
    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    
}

extension String {
    
    func key() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
    
}
