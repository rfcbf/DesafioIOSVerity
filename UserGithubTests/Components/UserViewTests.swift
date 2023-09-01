//
//  UserViewTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class UserViewTests: XCTestCase {
    
    var userView = UserView(frame: CGRect(origin: .zero, size: CGSize(width: 500, height: 500)))
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitWidgets() {
        XCTAssertNotNil(userView.avatar.image)
        XCTAssertNotNil(userView.arrow.image)
    }
    
    func testSetData() {
        let user = UsersModel(login: "teste", avatarURL: URL(string: "https://google.com"), type: "User", siteAdmin: false)
        userView.setup(user: user)
        
        XCTAssertEqual(userView.loginLabel.text, "Login: teste")
        XCTAssertEqual(userView.typeLabel.text, "Tipo de usuario: User")
        XCTAssertEqual(userView.admLabel.text, "Administrador: Não")
        
        XCTAssertNotNil(userView.avatar.sd_imageIndicator)
        XCTAssertNotNil(userView.avatar.sd_imageIndicator?.startAnimatingIndicator())
        XCTAssertNotNil(userView.avatar.sd_imageIndicator?.stopAnimatingIndicator())
    }
    
    func testInitWithFrame() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let userViewWithFrame = UserView(frame: frame)
        
        XCTAssertEqual(userViewWithFrame.frame, frame)
        XCTAssertEqual(userViewWithFrame.subviews.count, 1)
        XCTAssertEqual(userViewWithFrame.subviews.first, userViewWithFrame.containerView)
    }
    
    func testInit() {
        XCTAssertEqual(userView.frame, CGRect(origin: .zero, size: CGSize(width: 500, height: 500)))
        XCTAssertEqual(userView.subviews.count, 1)
        XCTAssertEqual(userView.subviews.first, userView.containerView)
    }
    
    func testDraw() {
        userView.draw(CGRect(origin: .zero, size: CGSize(width: 500, height: 500)))
        XCTAssertEqual(userView.subviews.count, 1)
        XCTAssertEqual(userView.subviews.first, userView.containerView)
    }
}

