//
//  CounterView.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import SwiftUI

struct CounterView: View {
    
    let count: Int
    let large: Bool
    
    var body: some View {
        Text(count.description)
            .font(large ? .title : .title2)
            .foregroundColor(.accentColor)
            .bold()
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(count: 0, large: false)
    }
}
