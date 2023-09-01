//
//  RepoPresenterTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class RepoPresenterTests: XCTestCase {
    
    var presenter: RepoPresenter!
    var mockInteractor: MockRepoInteractor!
    var mockRouter: MockRepoRouter!
    var mockOutput: MockRepoPresenterOutputProtocol!
    
    override func setUp() {
        super.setUp()
        mockInteractor = MockRepoInteractor()
        mockRouter = MockRepoRouter()
        mockOutput = MockRepoPresenterOutputProtocol()
        
        presenter = RepoPresenter(interactor: mockInteractor, router: mockRouter)
        presenter.output = mockOutput
    }
    
    override func tearDown() {
        presenter = nil
        mockInteractor = nil
        mockRouter = nil
        mockOutput = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        presenter.viewDidLoad()
        
        XCTAssertTrue(mockOutput.presentLoadingCalled)
    }
    
    func testViewWillAppear() {
        presenter.viewWillAppear()
        
        XCTAssertFalse(mockOutput.presentLoadingCalled)
        XCTAssertFalse(mockInteractor.fetchCalled)
    }
    
    func testGetRepo() {
        let repo = RepoModel(name: "teste")
        presenter.viewModel = [repo]
        
        let returnedRepo = presenter.getRepo(at: 0)
        
        XCTAssertEqual(returnedRepo.name, repo.name)
        XCTAssertFalse(mockOutput.showViewErrorCalled)
    }
    
    func testGetRepoWithEmptyViewModel() {
        let returnedRepo = presenter.getRepo(at: 0)
        
        XCTAssertNil(returnedRepo.name)
        XCTAssertTrue(mockOutput.showViewErrorCalled)
    }
}

class MockRepoInteractor: RepoInteractorInputProtocol {
    var user: String = ""
    var fetchCalled = false
    
    func fetch() {
        fetchCalled = true
    }
}

class MockRepoRouter: RepoRouter {}

class MockRepoPresenterOutputProtocol: RepoPresenterOutputProtocol {
    var updateUIListCalled = false
    var presentLoadingCalled = false
    var stopLoadingCalled = false
    var showViewOutInternetCalled = false
    var showViewErrorCalled = false
    
    func updateUIList() {
        updateUIListCalled = true
    }
    
    func presentLoading() {
        presentLoadingCalled = true
    }
    
    func stopLoading() {
        stopLoadingCalled = true
    }
    
    func showViewOutInternet() {
        showViewOutInternetCalled = true
    }
    
    func showViewError() {
        showViewErrorCalled = true
    }
}
