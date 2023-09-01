//
//  HomeRouterTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class HomeRouterTests: XCTestCase {
    
    var sut: HomeRouter!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        
        sut = HomeRouter()
        window = UIWindow()
    }
    
    override func tearDown() {
        sut = nil
        window = nil
        
        super.tearDown()
    }
    
    func testPresent() {
        // Given
        let viewController = UIViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        // When
        sut.present(in: window)
        
        // Then
        XCTAssertEqual(navigationController.viewControllers.first, viewController)
    }
    
    func testPresentPullRequests() {
        // Given
        let user = "testUser"
        let navigationController = UINavigationController()
        sut.navigationController = navigationController
        
        // When
        sut.presentPullRequests(user)
        
        // Then
        XCTAssertTrue(navigationController.topViewController is DetailUserViewController)
    }
}
