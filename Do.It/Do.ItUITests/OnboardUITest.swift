//
//  OnboardUITest.swift
//  Do.ItUITests
//
//  Created by Ana Karolina Costa da Silva on 24/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import XCTest
@testable import Do_It

class OnboardUITest: XCTestCase {

    func test_onboardButtons_actionables() {
        let app = XCUIApplication()
        
        app.launchArguments = ["-reset"]
        app.launch()
        
        let nextStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["NEXT"]/*[[".buttons[\"NEXT\"].staticTexts[\"NEXT\"]",".staticTexts[\"NEXT\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(nextStaticText.isHittable)
        nextStaticText.tap()
        
        let secondButton = app/*@START_MENU_TOKEN@*/.staticTexts["PREV"]/*[[".buttons[\"PREV\"].staticTexts[\"PREV\"]",".staticTexts[\"PREV\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(secondButton.isHittable)
        secondButton.tap()
        
        nextStaticText.tap()
        let lastButton = app.staticTexts["NEXT"]
        lastButton.tap()
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["terminar essa desgraça"]/*[[".cells.staticTexts[\"terminar essa desgraça\"]",".staticTexts[\"terminar essa desgraça\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["trailing0"]/*[[".cells",".buttons[\"Delete\"]",".buttons[\"trailing0\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
}
