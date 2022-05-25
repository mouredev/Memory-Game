//
//  TitleView.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import SwiftUI

struct TitleView: View {
    
    let key: LocalizedStringKey
    
    var body: some View {
        Text(key)
            .font(.largeTitle)
            .foregroundColor(.accentColor)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .textCase(.uppercase)
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(key: "Title")
    }
}
