//
//  ApiFactoryTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class ApiFactoryTests: XCTestCase {
    
    func testDecodeUsers() {
        // Given
        let json: [String: Any] = [
            "login": "teste",
            "type": "User"
        ]
        
        // When
        let result = APIFactory.decode(users: json)
        
        // Then
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.login, "teste")
        XCTAssertEqual(result?.type, "User")
    }
    
    func testDecodeDetailUser() {
        // Given
        let json: [String: Any] = [
            "login": "teste",
            "email": "teste@teste.com"
        ]
        
        // When
        let result = APIFactory.decode(detailUser: json)
        
        // Then
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.login, "teste")
        XCTAssertEqual(result?.email, "teste@teste.com")
    }
    
    func testDecodeRepo() {
        // Given
        let json: [String: Any] = [
            "name": "teste",
            "full_name": "fullName"
        ]
        
        // When
        let result = APIFactory.decode(repo: json)
        
        // Then
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.name, "teste")
        XCTAssertEqual(result?.fullName, "fullName")
    }
    
}
