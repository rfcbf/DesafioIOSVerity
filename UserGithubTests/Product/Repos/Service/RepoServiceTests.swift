//
//  RepoServiceTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class RepoServiceTests: XCTestCase {
    
    var repoService: RepoService!
    
    override func setUp() {
        super.setUp()
        repoService = RepoService()
    }
    
    override func tearDown() {
        repoService = nil
        super.tearDown()
    }
    
    func testGetRepo() {
        let expectation = XCTestExpectation(description: "Get repos")
        
        repoService.get(user: "teste") { repos in
            XCTAssertNotNil(repos)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}
