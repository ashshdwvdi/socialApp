//
//  FriendZonedUITests.swift
//  FriendZonedUITests
//
//  Created by Ashish Dwivedi on 20/11/18.
//  Copyright © 2018 Ashish Dwivedi. All rights reserved.
//

import XCTest

class FriendZonedUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Hyde Chaurasia").children(matching: .other).element(boundBy: 0).swipeRight()/*[[".cells.containing(.image, identifier:\"feed3\").children(matching: .other).element(boundBy: 0)",".swipeUp()",".swipeRight()",".cells.containing(.staticText, identifier:\"@hyde\").children(matching: .other).element(boundBy: 0)",".cells.containing(.staticText, identifier:\"Hyde Chaurasia\").children(matching: .other).element(boundBy: 0)"],[[[-1,4,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        
        let homeNavigationBar = app.navigationBars["Home"]
        homeNavigationBar.buttons["Search"].tap()
        homeNavigationBar.buttons["Share"].tap()
        app.tabBars.buttons["Home"].tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.cells.containing(.image, identifier:"u3")/*[[".cells.containing(.staticText, identifier:\"@hyde\")",".cells.containing(.staticText, identifier:\"Hyde Chaurasia\")",".cells.containing(.image, identifier:\"u3\")"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["edit"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
