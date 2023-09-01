//
//  RepoViewCellControllerTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class RepoViewCellControllerTests: XCTestCase {
    
    var sut: RepoViewCellController!
    var mockDelegate: MockRepoCellDelegate!
    var mockRepo: RepoModel!
    
    override func setUp() {
        super.setUp()
        mockDelegate = MockRepoCellDelegate()
        mockRepo = RepoModel()
        sut = RepoViewCellController(delegate: mockDelegate)
    }
    
    override func tearDown() {
        sut = nil
        mockDelegate = nil
        mockRepo = nil
        super.tearDown()
    }
    
    func testSetup() {
        // Given
        let repo = RepoModel()
        
        // When
        sut.setup(repo: repo)
        
        // Then
        XCTAssertEqual(sut.repo.name, repo.name)
    }
    
    func testSetData() {
        // Given
        sut.repo = mockRepo
        
        // When
        sut.setData()
        
        // Then
        XCTAssertTrue(mockDelegate.setReposCalled)
        XCTAssertEqual(mockDelegate.receivedRepo?.name, mockRepo.name)
    }
}

class MockRepoCellDelegate: RepoCellDelegate {
    
    var setReposCalled = false
    var receivedRepo: RepoModel?
    
    func setRepos(repo: RepoModel) {
        setReposCalled = true
        receivedRepo = repo
    }
}
