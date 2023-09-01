//
//  RepoModelTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class RepoModelTests: XCTestCase {
    
    func testInit() {
        
        let userModel = RepoModel(name: "teste",
                                  fullName: "teste",
                                  htmlURL: nil,
                                  createdAt: "2021-01-01",
                                  visibility: "full")
        
        XCTAssertEqual(userModel.name, "teste")
        XCTAssertEqual(userModel.fullName, "teste")
        XCTAssertNil(userModel.htmlURL)
        XCTAssertEqual(userModel.visibility, "full")
        XCTAssertEqual(userModel.createdAt, "2021-01-01")
    }
}
