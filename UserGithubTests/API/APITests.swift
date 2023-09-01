//
//  APITests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class APITests: XCTestCase {
    
    var api: API!
    
    override func setUp() {
        super.setUp()
        api = API.instance
    }
    
    override func tearDown() {
        api = nil
        super.tearDown()
    }
    
    func testGetUsers() {
        let expectation = XCTestExpectation(description: "Get users")
        
        api.getUsers { users in
            XCTAssertNotNil(users)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testGetDetailUsers() {
        let expectation = XCTestExpectation(description: "Get detail users")
        
        api.getDeatilUsers(user: "teste") { detailUser in
            XCTAssertNotNil(detailUser)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testGetRepo() {
        let expectation = XCTestExpectation(description: "Get repo")
        
        api.getRepo(user: "teste") { repos in
            XCTAssertNotNil(repos)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
