//
//  UsersServiceTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class UsersServiceTests: XCTestCase {
    
    var usersService: UsersService!
    
    override func setUp() {
        super.setUp()
        usersService = UsersService()
    }
    
    override func tearDown() {
        usersService = nil
        super.tearDown()
    }
    
    func testGetUsers() {
        let expectation = XCTestExpectation(description: "Get user")
        
        usersService.get { users in
            XCTAssertNotNil(users)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
