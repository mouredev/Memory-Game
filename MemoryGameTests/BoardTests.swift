//
//  BoardTests.swift
//  MemoryGameTests
//
//  Created by Brais Moure on 13/5/22.
//

import XCTest
@testable import Memory_Game

class BoardTests: XCTestCase {

    private let viewModel = BoardViewModel()
    
    func testLoadCards() throws {
        viewModel.loadCards(difficultyLevel: .easy)
        XCTAssertEqual(viewModel.cards?.count ?? 0, 16)
        XCTAssertEqual(viewModel.movements, 0)
        XCTAssertEqual(viewModel.remaining, 8)
        XCTAssertTrue(viewModel.seconds == Configuration.gameTime)
        XCTAssertFalse(viewModel.disabled)
        viewModel.cards?.forEach({ card in
            XCTAssertFalse(card.matched)
            XCTAssertFalse(card.flipped)
        })
    }
    
    func testCheckCard() throws {
        let card = Card(id: 1)
        viewModel.checkCard(currentCard: card)        
        XCTAssertEqual(viewModel.movements, 1)
        XCTAssertEqual(viewModel.movements, 1)
    }
    
    func testCheckGameText() throws {
        XCTAssertTrue(viewModel.checkGameText() == "board.won")
    }
    
}
