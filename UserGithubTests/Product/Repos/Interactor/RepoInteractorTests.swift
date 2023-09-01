//
//  RepoInteractorTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class RepoInteractorTests: XCTestCase {
    var interactor: RepoInteractor!
    var mockService: MockRepoService!
    var mockOutput: MockRepoInteractorOutput!

    override func setUp() {
        super.setUp()
        mockService = MockRepoService()
        mockOutput = MockRepoInteractorOutput()
        interactor = RepoInteractor(service: mockService, user: "teste")
        interactor.output = mockOutput
    }

    override func tearDown() {
        mockService = nil
        mockOutput = nil
        interactor = nil
        super.tearDown()
    }

    func testFetchUsersSuccess() {
        let expectedRepos: [RepoModel] = [RepoModel(name: "teste"), RepoModel(name: "teste")]
        mockService.mockRepos = expectedRepos

        interactor.fetch()

        XCTAssertTrue(mockOutput.didFetchRepo)
    }

    func testFetchUsersEmptyResponse() {
        mockService.mockRepos = []

        interactor.fetch()

        XCTAssertTrue(mockOutput.didFetchRepo)
        XCTAssertNotNil(mockOutput.fetchedRepo)
        XCTAssertTrue(mockOutput.fetchedRepo!.isEmpty)
    }

    func testFetchUsersFailure() {
        mockService.mockError = NSError(domain: "Test", code: 500, userInfo: nil)

        interactor.fetch()

        XCTAssertTrue(mockOutput.didFetchRepo)
        XCTAssertNil(mockOutput.fetchedRepo)
    }
}

class MockRepoService: RepoServiceProtocol {
    var mockRepos: [RepoModel]?
    var mockError: Error?

    func get(user: String, completion: @escaping RepoHandler) {
        if let _ = mockError {
            completion(nil)
        } else {
            completion(mockRepos)
        }
    }
}

class MockRepoInteractorOutput: RepoInteractorOutputProtocol {
    var didFetchRepo = false
    var fetchedRepo: [RepoModel]?

    func fetched(_ repo: [RepoModel]?) {
        didFetchRepo = true
        fetchedRepo = repo
    }
}
