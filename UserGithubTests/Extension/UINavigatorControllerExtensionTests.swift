//
//  UINavigatorControllerExtensionTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class UINavigatorControllerExtensionTests: XCTestCase {
    
    var navigationController: UINavigationController!
    
    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
    }
    
    override func tearDown() {
        navigationController = nil
        super.tearDown()
    }
    
    func testSetupNavBarColor() {
        // Given
        let expectedBackgroundColor = UIColor.black
        let expectedTintColor = UIColor.white
        
        // When
        navigationController.setupNavBarColor()
        
        // Then
        XCTAssertEqual(navigationController.navigationBar.standardAppearance.backgroundColor, expectedBackgroundColor)
        XCTAssertEqual(navigationController.navigationBar.scrollEdgeAppearance?.backgroundColor, expectedBackgroundColor)
        XCTAssertEqual(navigationController.navigationBar.compactAppearance?.backgroundColor, expectedBackgroundColor)
        XCTAssertEqual(navigationController.navigationBar.tintColor, expectedTintColor)
        XCTAssertEqual(UIBarButtonItem.appearance().tintColor, expectedTintColor)
    }
}
