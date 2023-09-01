//
//  InternetOutViewTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class InternetOutViewTests: XCTestCase {
    
    var internetOutView: InternetOutView!
    
    override func setUp() {
        super.setUp()
        internetOutView = InternetOutView(tapAction: {})
    }
    
    override func tearDown() {
        internetOutView = nil
        super.tearDown()
    }
    
    func testContainerViewExists() {
        XCTAssertNotNil(internetOutView.containerView)
    }
    
    func testImageExists() {
        XCTAssertNotNil(internetOutView.image)
    }
    
    func testTitleExists() {
        XCTAssertNotNil(internetOutView.title)
    }
    
    func testSubTitleExists() {
        XCTAssertNotNil(internetOutView.subTitle)
    }
    
    func testButtonRetryExists() {
        XCTAssertNotNil(internetOutView.buttonRetry)
    }
    
    func testImageContentModeIsScaleAspectFill() {
        XCTAssertEqual(internetOutView.image.contentMode, .scaleAspectFill)
    }
    
    func testImageClipsToBoundsIsTrue() {
        XCTAssertTrue(internetOutView.image.clipsToBounds)
    }
    
    func testImageLayerBorderColorIsBlack() {
        XCTAssertEqual(internetOutView.image.layer.borderColor, UIColor.black.cgColor)
    }
    
    func testTitleTextIsCorrect() {
        XCTAssertEqual(internetOutView.title.text, "Ops, estamos sem internet")
    }
    
    func testTitleTextColorIsBlack() {
        XCTAssertEqual(internetOutView.title.textColor, UIColor.black)
    }
    
    func testTitleFontIsBoldSystemFontWithSize18() {
        XCTAssertEqual(internetOutView.title.font, UIFont.boldSystemFont(ofSize: 18))
    }
    
    func testSubTitleTextIsCorrect() {
        XCTAssertEqual(internetOutView.subTitle.text, "No momento não posso continuar, que tal tentar mais tarde!!!!")
    }
    
    func testSubTitleTextColorIsGray() {
        XCTAssertEqual(internetOutView.subTitle.textColor, UIColor.gray)
    }
    
    func testSubTitleFontIsBoldSystemFontWithSize14() {
        XCTAssertEqual(internetOutView.subTitle.font, UIFont.boldSystemFont(ofSize: 14))
    }
    
    func testButtonRetryTitleIsCorrect() {
        XCTAssertEqual(internetOutView.buttonRetry.title(for: .normal), "Tentar novamente")
    }
    
    func testButtonRetryTintColorIsWhite() {
        XCTAssertEqual(internetOutView.buttonRetry.tintColor, UIColor.white)
    }
    
    func testButtonRetryBackgroundColorIsBlack() {
        XCTAssertEqual(internetOutView.buttonRetry.backgroundColor, UIColor.black)
    }
    
    func testButtonRetryCornerRadiusIs16() {
        XCTAssertEqual(internetOutView.buttonRetry.layer.cornerRadius, 16)
    }
    
    func testAddTappedCallsAction() {
        var actionCalled = false
        let internetOutView = InternetOutView(tapAction: {
            actionCalled = true
        })
        internetOutView.addTapped()
        XCTAssertTrue(actionCalled)
    }
}
