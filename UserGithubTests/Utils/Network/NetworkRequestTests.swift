//
//  NetworkRequestTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
import Alamofire
@testable import UserGithub

class NetworkRequestTests: XCTestCase {
    
    var networkRequest: NetworkRequest!
    let url = "https://api.github.com/users"

    override func setUp() {
        super.setUp()
        networkRequest = NetworkRequest.instance
    }
    
    override func tearDown() {
        networkRequest = nil
        super.tearDown()
    }
    
    func testGetRequest() {
        let expectation = XCTestExpectation(description: "Get request")
        
        networkRequest.get(url: url, headers: nil) { response in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testAsURL() {
        let convertedURL = networkRequest.asURL(url)
        
        XCTAssertNotNil(convertedURL)
    }
    
    static var allTests = [
        ("testGetRequest", testGetRequest),
        ("testAsURL", testAsURL)
    ]
}
