//
//  DetailUserInteractorTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class DetailInteractorTests: XCTestCase {
    var interactor: DetailUserInteractor!
    var mockService: MockDetailUsersService!
    var mockOutput: MockDetailUserInteractorOutput!

    override func setUp() {
        super.setUp()
        mockService = MockDetailUsersService()
        mockOutput = MockDetailUserInteractorOutput()
        interactor = DetailUserInteractor(service: mockService, user: "user1")
        interactor.output = mockOutput
    }

    override func tearDown() {
        mockService = nil
        mockOutput = nil
        interactor = nil
        super.tearDown()
    }

    func testFetchDetailUsersSuccess() {
        let expectedUsers: DetailUserModel = DetailUserModel(login: "user1")
        mockService.mockDetailUsers = expectedUsers

        interactor.fetch()

        XCTAssertTrue(mockOutput.didFetchDetailUsers)
    }

    func testFetchDetailUsersEmptyResponse() {
        mockService.mockDetailUsers = nil

        interactor.fetch()

        XCTAssertTrue(mockOutput.didFetchDetailUsers)
    }

    func testFetchDetailUsersFailure() {
        mockService.mockError = NSError(domain: "TestDomain", code: 500, userInfo: nil)

        interactor.fetch()

        XCTAssertTrue(mockOutput.didFetchDetailUsers)
        XCTAssertNil(mockOutput.fetchedDetailUsers)
    }
}

class MockDetailUsersService: DeatilUsersServiceProtocol {
    var mockDetailUsers: DetailUserModel?
    var mockError: Error?

    
    func get(user: String, completion: @escaping DetailUsersHandler) {
        if let _ = mockDetailUsers {
            completion(nil)
        } else {
            completion(mockDetailUsers)
        }
    }
}

class MockDetailUserInteractorOutput: DetailUserInteractorOutputProtocol {
    
    var didFetchDetailUsers = false
    var fetchedDetailUsers: DetailUserModel?

    func fetched(_ user: DetailUserModel?) {
        didFetchDetailUsers = true
        fetchedDetailUsers = user
    }
}
