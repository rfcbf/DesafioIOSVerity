//
//  RepoRouterTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class RepoRouterTests: XCTestCase {
    
    var sut: RepoRouter!
    var navigationController: UINavigationController!
    
    override func setUp() {
        super.setUp()
        sut = RepoRouter()
        navigationController = UINavigationController()
    }
    
    override func tearDown() {
        sut = nil
        navigationController = nil
        super.tearDown()
    }
    
    func testPresent() {
        let user = "teste"
        
        sut.present(navigationController: navigationController, user: user)
        
        XCTAssertEqual(sut.user, user)
        XCTAssertEqual(sut.navigationController, navigationController)
        XCTAssertTrue(navigationController.viewControllers.count == 1)
    }
    
    func testPresent_navigationController_nil() {
        let user = "teste"
        
        sut.navigationController = nil
        sut.present(navigationController: navigationController, user: user)
        
        XCTAssertTrue(true)
    }
}
