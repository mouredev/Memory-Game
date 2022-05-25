//
//  BoardUITest.swift
//  MemoryGameUITests
//
//  Created by Brais Moure on 13/5/22.
//

import XCTest

class BoardUITest: XCTestCase  {
    
    private let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        app.otherElements.buttons["Easy"].tap()
    }

    func testTitle() throws {        
        let title = app.staticTexts["easy".uppercased()]
        XCTAssert(title.exists)
    }

}
