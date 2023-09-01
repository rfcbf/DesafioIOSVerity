//
//  HomePresenterTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class HomePresenterTests: XCTestCase {
    
    var presenter: HomePresenter!
    var mockInteractor: MockHomeInteractor!
    var mockRouter: MockHomeRouter!
    var mockOutput: MockHomePresenterOutputProtocol!
    
    override func setUp() {
        super.setUp()
        
        mockInteractor = MockHomeInteractor()
        mockRouter = MockHomeRouter()
        mockOutput = MockHomePresenterOutputProtocol()
        
        presenter = HomePresenter(interactor: mockInteractor, router: mockRouter)
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
    
    func testLoadDataWithNetworkAvailable() {
        mockInteractor.fetchExpectation = expectation(description: "Fetch Users")
        
        presenter.loadData()
        
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertTrue(mockInteractor.fetchCalled)
    }
    
    func testDidSelectCellWithValidUser() {
        let user = UsersModel(login: "teste")
        
        presenter.didSelectCellFiltred(user: user)
        
        XCTAssertTrue(mockRouter.presentPullRequestsCalled)
        XCTAssertEqual(mockRouter.presentPullRequestsLogin, "teste")
    }
    
    func testDidSelectCellWithInvalidUser() {
        let user = UsersModel()
        
        presenter.didSelectCellFiltred(user: user)
        
        XCTAssertTrue(mockOutput.showViewErrorCalled)
        XCTAssertFalse(mockRouter.presentPullRequestsCalled)
    }
    
    func testGetUserWithValidIndex() {
        let user = UsersModel(login: "teste")
        presenter.viewModel = [user]
        
        let returnedUser = presenter.getUser(at: 0)
        
        XCTAssertEqual(returnedUser.login, "teste")
        XCTAssertFalse(mockOutput.showViewErrorCalled)
    }
    
    func testGetUserWithInvalidIndex() {
        let user = UsersModel(login: "teste")
        presenter.viewModel = [user]

        let userSelect = presenter.getUser(at: 0)
        
        XCTAssertEqual(userSelect.login, "teste")
    }
}

class MockHomeInteractor: HomeInteractorInputProtocol {
    
    var fetchCalled = false
    var fetchExpectation: XCTestExpectation?
    
    func fetch() {
        fetchCalled = true
        fetchExpectation?.fulfill()
    }
}

class MockHomeRouter: HomeRouter {
    
    var presentPullRequestsCalled = false
    var presentPullRequestsLogin: String?
    
    override func presentPullRequests(_ login: String) {
        presentPullRequestsCalled = true
        presentPullRequestsLogin = login
    }
}

class MockHomePresenterOutputProtocol: HomePresenterOutputProtocol {
    
    var updateUIListCalled = false
    var presentLoadingCalled = false
    var stopLoadingCalled = false
    var showViewOutInternetCalled = false
    var showViewErrorCalled = false
    
    var showViewOutInternetExpectation: XCTestExpectation?
    
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
        showViewOutInternetExpectation?.fulfill()
    }
    
    func showViewError() {
        showViewErrorCalled = true
    }
}
