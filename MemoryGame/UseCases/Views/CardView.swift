//
//  CardView.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var card: Card
    let tap: () -> Void
    
    //@State private var flipped = false
    @State private var cardRotation = 0.0
    @State private var contentRotation = 0.0
    
    var body: some View {
        ZStack {
            if card.flipped {
                Image("card-\(card.id)")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.accentColor)
                    .aspectRatio(contentMode: .fit)
                    .padding(.small)
            } else {
                BigTextView(key: "?")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.accentColor.colorInvert())
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .cornerRadius(.small)
        .opacity(card.matched ? 0.2 : 1)
        .onTapGesture {
            if !card.flipped && !card.matched {
                flip()
                tap()
            }
        }
        .rotation3DEffect(.degrees(cardRotation), axis: (x: 0, y: 1, z: 0))
    }
    
    private func flip() {
        let animationTime = 0.3
        withAnimation(Animation.linear(duration: animationTime)) {
            cardRotation += 180
        }
        
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation += 180
            card.flipped.toggle()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: 1)) {
            print("Tap")
        }
    }
}
