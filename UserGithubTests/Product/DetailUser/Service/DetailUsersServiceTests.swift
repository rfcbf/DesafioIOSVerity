//
//  DetailUsersServiceTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class DetailUsersServiceTests: XCTestCase {
    
    var detailUsersService: DetailUsersService!
    
    override func setUp() {
        super.setUp()
        detailUsersService = DetailUsersService()
    }
    
    override func tearDown() {
        detailUsersService = nil
        super.tearDown()
    }
    
    func testGetDetailUsers() {
        let expectation = XCTestExpectation(description: "Get Detail")
        
        detailUsersService.get(user: "teste") { detailUserModel in
            XCTAssertNotNil(detailUserModel)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
