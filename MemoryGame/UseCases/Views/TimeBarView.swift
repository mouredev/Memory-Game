//
//  TimeBarView.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import SwiftUI

struct TimeBarView: View {
    
    let value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .frame(width: geometry.size.width)
                    .opacity(0.3)
                    .background(Color.accentColor.colorInvert())
                
                Rectangle()
                    .frame(width: min(CGFloat(value) * geometry.size.width, geometry.size.width))
                    .foregroundColor(Color.accentColor)
                    .animation(Animation.easeInOut(duration: 1.0), value: value)
                
            }
            .cornerRadius(.small)
        }.frame(height: .medium)
    }
}

struct TimeBarView_Previews: PreviewProvider {
    static var previews: some View {
        TimeBarView(value: 0.9)
    }
}
