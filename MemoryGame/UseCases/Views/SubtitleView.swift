//
//  SubtitleView.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import SwiftUI

struct SubtitleView: View {
    
    let key: LocalizedStringKey
    
    var body: some View {
        Text(key)
            .font(.title3)
            .foregroundColor(.accentColor)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        SubtitleView(key: "Subtitle")
    }
}
