//
//  APIBuilderTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class APIBuilderTests: XCTestCase {
    
    var apiBuilder: APIBuilder!
    
    override func setUp() {
        super.setUp()
        apiBuilder = APIBuilder()
    }
    
    override func tearDown() {
        apiBuilder = nil
        super.tearDown()
    }
    
    func testGetUsers() {
        let expectedURL = "https://api.github.com/users"
        
        let result = apiBuilder.getUsers().buildURL()
        
        XCTAssertEqual(result, expectedURL)
    }
    
    func testGetDetailUser() {
        let user = "teste"
        let expectedURL = "https://api.github.com/users/\(user)"
        
        let result = apiBuilder.getDetailUser(user: user).buildURL()
        
        XCTAssertEqual(result, expectedURL)
    }
    
    func testGetRepos() {
        let user = "teste"
        let expectedURL = "https://api.github.com/users/\(user)/repos"
        
        let result = apiBuilder.getRepos(user: user).buildURL()
        
        XCTAssertEqual(result, expectedURL)
    }
}
