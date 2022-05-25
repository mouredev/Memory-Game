//
//  MenuButtonView.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import SwiftUI

struct MenuButtonView: View {
    
    let key: LocalizedStringKey
    
    var body: some View {
        Text(key)
            .font(.title2)
            .bold()
            .padding(.medium)
            .frame(maxWidth: .infinity)
            .colorMultiply(Color.accentColor)
            .background(Color.accentColor.colorInvert())
            .cornerRadius(.small)
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView(key: "Button")
        MenuButtonView(key: "Button").preferredColorScheme(.dark)
    }
}
