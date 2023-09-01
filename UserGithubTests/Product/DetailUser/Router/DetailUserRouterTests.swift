//
//  DetailUserRouterTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class DetailUserRouterTests: XCTestCase {
    
    var router: DetailUserRouter!
    var navigationController: UINavigationController!
    
    override func setUp() {
        super.setUp()
        router = DetailUserRouter()
        navigationController = UINavigationController()
    }
    
    override func tearDown() {
        router = nil
        navigationController = nil
        super.tearDown()
    }
    
    func test_Present() {
        let user = "teste"
        
        router.present(navigationController: navigationController, user: user)
        
        XCTAssertEqual(router.user, user)
        XCTAssertEqual(router.navigationController, navigationController)
        XCTAssertTrue(navigationController.viewControllers.count == 1)
    }
    
    func test_PresentRepos() {
        let user = "teste"
        
        router.navigationController = navigationController
        router.presentRepos(user: user)
        
        XCTAssertTrue(navigationController.viewControllers.count == 1)
        XCTAssertTrue(navigationController.viewControllers.first is RepoViewController)
    }
    
    func test_PresentRepos_navigationController_nil() {
        let user = "teste"
        
        router.navigationController = nil
        router.presentRepos(user: user)
        
        XCTAssertTrue(true)
    }
}
