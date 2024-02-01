//
//  YummiUITests.swift
//  YummiUITests
//
//  Created by Phelan, Finnian (PAH) on 23/01/2024.
//

import XCTest

final class YummiUITests: XCTestCase {

    func testTakingScreenshotOfContentView() {
        let app = XCUIApplication()
        
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = "Content View"
        add(attachment)
    }
    
}
