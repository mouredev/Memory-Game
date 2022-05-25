//
//  test.swift
//  MemoryGameTests
//
//  Created by Brais Moure on 13/5/22.
//

import XCTest

class test: XCTestCase {

    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testTitle() throws {
        let title = app.staticTexts.element.firstMatch
        XCTAssert(title.exists)
        XCTAssertEqual(title.label, "The video game consoles memory game".uppercased())
    }
    
    func testButtonsCount() throws {
        XCTAssertEqual(app.otherElements.buttons.count, 3)
    }

}
