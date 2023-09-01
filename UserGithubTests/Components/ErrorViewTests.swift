//
//  ErrorViewTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class ErrorViewTests: XCTestCase {
    
    var errorView: ErrorView!
    
    override func setUp() {
        super.setUp()
        errorView = ErrorView(tapAction: {})
    }
    
    override func tearDown() {
        errorView = nil
        super.tearDown()
    }
    
    func testContainerViewExists() {
        XCTAssertNotNil(errorView.containerView)
    }
    
    func testImageExists() {
        XCTAssertNotNil(errorView.image)
    }
    
    func testTitleExists() {
        XCTAssertNotNil(errorView.title)
    }
    
    func testSubTitleExists() {
        XCTAssertNotNil(errorView.subTitle)
    }
    
    func testButtonRetryExists() {
        XCTAssertNotNil(errorView.buttonRetry)
    }
    
    func testImageContentModeIsScaleAspectFill() {
        XCTAssertEqual(errorView.image.contentMode, .scaleAspectFill)
    }
    
    func testImageClipsToBoundsIsTrue() {
        XCTAssertTrue(errorView.image.clipsToBounds)
    }
    
    func testImageLayerBorderColorIsBlack() {
        XCTAssertEqual(errorView.image.layer.borderColor, UIColor.black.cgColor)
    }
    
    func testTitleTextIsCorrect() {
        XCTAssertEqual(errorView.title.text, "Ops, Tivemos um problema")
    }
    
    func testTitleTextColorIsBlack() {
        XCTAssertEqual(errorView.title.textColor, UIColor.black)
    }
    
    func testTitleFontIsBoldSystemFontWithSize18() {
        XCTAssertEqual(errorView.title.font, UIFont.boldSystemFont(ofSize: 18))
    }
    
    func testSubTitleTextIsCorrect() {
        XCTAssertEqual(errorView.subTitle.text, "No momento não posso continuar, que tal tentar mais tarde!!!!")
    }
    
    func testSubTitleTextColorIsGray() {
        XCTAssertEqual(errorView.subTitle.textColor, UIColor.gray)
    }
    
    func testSubTitleFontIsBoldSystemFontWithSize14() {
        XCTAssertEqual(errorView.subTitle.font, UIFont.boldSystemFont(ofSize: 14))
    }
    
    func testButtonRetryTitleIsCorrect() {
        XCTAssertEqual(errorView.buttonRetry.title(for: .normal), "Tentar novamente")
    }
    
    func testButtonRetryTintColorIsWhite() {
        XCTAssertEqual(errorView.buttonRetry.tintColor, UIColor.white)
    }
    
    func testButtonRetryBackgroundColorIsBlack() {
        XCTAssertEqual(errorView.buttonRetry.backgroundColor, UIColor.black)
    }
    
    func testButtonRetryCornerRadiusIs16() {
        XCTAssertEqual(errorView.buttonRetry.layer.cornerRadius, 16)
    }
    
    func testAddTappedCallsAction() {
        var actionCalled = false
        let errorView = ErrorView(tapAction: {
            actionCalled = true
        })
        errorView.addTapped()
        XCTAssertTrue(actionCalled)
    }
    
}
