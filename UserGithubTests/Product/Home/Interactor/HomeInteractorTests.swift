//
//  HomeInteractorTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class HomeInteractorTests: XCTestCase {
    var interactor: HomeInteractor!
    var mockService: MockUsersService!
    var mockOutput: MockHomeInteractorOutput!

    override func setUp() {
        super.setUp()
        mockService = MockUsersService()
        mockOutput = MockHomeInteractorOutput()
        interactor = HomeInteractor(service: mockService)
        interactor.output = mockOutput
    }

    override func tearDown() {
        mockService = nil
        mockOutput = nil
        interactor = nil
        super.tearDown()
    }

    func testFetchUsersSuccess() {
        let expectedUsers: [UsersModel] = [UsersModel(login: "user1"), UsersModel(login: "user2")]
        mockService.mockUsers = expectedUsers

        interactor.fetch()

        XCTAssertTrue(mockOutput.didFetchUsers)
    }

    func testFetchUsersEmptyResponse() {
        mockService.mockUsers = []

        interactor.fetch()

        XCTAssertTrue(mockOutput.didFetchUsers)
        XCTAssertNotNil(mockOutput.fetchedUsers)
        XCTAssertTrue(mockOutput.fetchedUsers!.isEmpty)
    }

    func testFetchUsersFailure() {
        mockService.mockError = NSError(domain: "TestDomain", code: 500, userInfo: nil)

        interactor.fetch()

        XCTAssertTrue(mockOutput.didFetchUsers)
        XCTAssertNil(mockOutput.fetchedUsers)
    }
}

class MockUsersService: UsersServiceProtocol {
    var mockUsers: [UsersModel]?
    var mockError: Error?

    func get(completion: @escaping UsersHandler) {
        if let _ = mockError {
            completion(nil)
        } else {
            completion(mockUsers)
        }
    }
}

class MockHomeInteractorOutput: HomeInteractorOutputProtocol {
    var didFetchUsers = false
    var fetchedUsers: [UsersModel]?

    func fetched(users: [UsersModel]?) {
        didFetchUsers = true
        fetchedUsers = users
    }
}
