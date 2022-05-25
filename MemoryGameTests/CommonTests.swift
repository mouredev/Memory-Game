//
//  CommonTests.swift
//  MemoryGameTests
//
//  Created by Brais Moure on 12/5/22.
//

import XCTest
@testable import Memory_Game

class CommonTests: XCTestCase {

    func testGameTime() throws {
        XCTAssertTrue(Configuration.gameTime >= 60)
    }
    
    func testCardInitState() throws {
        let card = Card(id: 1)
        XCTAssertFalse(card.matched)
        XCTAssertFalse(card.flipped)
    }
    
    func testDifficultyLevels() throws {
        XCTAssertEqual(DifficultyLevel.allCases.count, 3)
    }
    
    func testDifficultyLevelsBoardSize() throws {
        let easy = DifficultyLevel.easy
        XCTAssertEqual(easy.boadSize.row, 4)
        XCTAssertEqual(easy.boadSize.column, 4)
        
        let medium = DifficultyLevel.medium
        XCTAssertEqual(medium.boadSize.row, 6)
        XCTAssertEqual(medium.boadSize.column, 4)
        
        let hard = DifficultyLevel.hard
        XCTAssertEqual(hard.boadSize.row, 6)
        XCTAssertEqual(hard.boadSize.column, 5)
    }

}
