//
//  BoardViewModel.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import Foundation

final class BoardViewModel: ObservableObject {

    @Published private(set) var cards: [Card]?
    @Published private(set) var movements = 0
    @Published private(set) var remaining = 0
    @Published private(set) var seconds = 0
    @Published private(set) var progress: Float = 0
    @Published private(set) var disabled = false
    
    private var tapCount = 0
    private var timer: Timer?
    
    // Lokalized
    
    let movementsTextKey = "board.totalmovements"
    let remainingTextKey = "board.remainingpairs"
    let levelsTextKey = "menu.level.title"
    
    // Public
    
    func loadCards(difficultyLevel: DifficultyLevel) {

        let pairs = (difficultyLevel.boadSize.row * difficultyLevel.boadSize.column) / 2
        
        var sortedCards: [Card] = []
        for id in 1...pairs {
            sortedCards.append(Card(id: id))
            sortedCards.append(Card(id: id))
        }
        
        cards = sortedCards.shuffled()
        movements = 0
        remaining = pairs
        seconds = Configuration.gameTime
        disabled = false
    }
    
    func checkCard(currentCard: Card) {
        
        if movements == 0 {
            startTimer()
        }

        disabled = true
        
        tapCount += 1
        
        if let matchedCard = cards?.first(where: { card in
            return card.id == currentCard.id && card.uuid != currentCard.uuid && card.flipped
        }) {
            currentCard.matched = true
            matchedCard.matched = true
            tapCount = 0
            decreaseRemaining()
            disabled = false
        } else if tapCount == 2, let notMatechedCard = cards?.first(where: { card in
            return card.flipped && !card.matched && card.id != currentCard.id
        }) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                currentCard.matched = false
                currentCard.flipped = false
                notMatechedCard.matched = false
                notMatechedCard.flipped = false
                self.tapCount = 0
                if self.seconds > 0 {
                    self.disabled = false
                }
            }
        } else {
            disabled = false
        }
        
        addMovement()
    }
    
    func checkGameText() -> String? {
        
        if seconds == 0 && disabled {
            return "board.lost"
        } else if remaining == 0 {
            return "board.won"
        } else if movements == 0 && !disabled {
            return "board.start"
        }
        return nil
    }
    
    func endGame() {
        stopTimer()
    }
    
    // Private
    
    private func addMovement() {
        movements += 1
    }
    
    private func decreaseRemaining() {
        remaining -= 1
        if remaining == 0 {
            stopTimer()
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.seconds -= 1
            self.progress = Float(self.seconds) / Float(Configuration.gameTime)
            if self.seconds == 0 {
                self.stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.disabled = true
    }
    
}
