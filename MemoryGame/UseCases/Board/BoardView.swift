//
//  BoardView.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import SwiftUI

struct BoardView: View {
    
    let difficultyLevel: DifficultyLevel
    
    @ObservedObject private var viewModel = BoardViewModel()
    
    @Environment(\.presentationMode) private var presentation
    
    var body: some View {
        VStack {
            
            TitleView(key: difficultyLevel.nameKey.key())
            
            HStack {
                SubtitleView(key: viewModel.movementsTextKey.key())
                CounterView(count: viewModel.movements, large: false)
            }.padding(.top, .small)
            HStack {
                SubtitleView(key: viewModel.remainingTextKey.key())
                CounterView(count: viewModel.remaining, large: false)
            }
            
            Spacer()

            HStack {
                TimeBarView(value: viewModel.progress)
                CounterView(count: viewModel.seconds, large: true)
                    .frame(width: CGFloat(Configuration.gameTime.description.count) * 20, alignment: .trailing)
            }

            if let cards = viewModel.cards {
                ZStack {                    
                    VStack(spacing: .small) {
                        ForEach(0..<difficultyLevel.boadSize.row, id: \.self) { row in
                            HStack(spacing: .small) {
                                ForEach(0..<difficultyLevel.boadSize.column, id: \.self) { column in
                                    let card = cards[row * difficultyLevel.boadSize.column + column]
                                    CardView(card: card, tap: {
                                        viewModel.checkCard(currentCard: card)
                                    })
                                    .allowsHitTesting(!viewModel.disabled)
                                }
                            }
                        }
                    }.opacity(viewModel.checkGameText() != nil ? 0.5 : 1)
                    
                    if let text = viewModel.checkGameText() {
                        BigTextView(key: text.key())
                            .allowsHitTesting(false)
                    }
                }
            }
            
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                MenuButtonView(key: viewModel.levelsTextKey.key())
                    .padding(.top, .medium)
            }
        }
        .padding()
        .navigationBarHidden(true)
        .onAppear {
            viewModel.loadCards(difficultyLevel: difficultyLevel)
        }
        .onDisappear {
            viewModel.endGame()
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView(difficultyLevel: .hard)
        BoardView(difficultyLevel: .easy).preferredColorScheme(.dark)
    }
}
