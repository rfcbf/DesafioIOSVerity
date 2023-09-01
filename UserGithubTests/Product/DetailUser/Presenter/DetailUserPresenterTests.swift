//
//  DetailUserPresenterTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class DetailUserPresenterTests: XCTestCase {
    
    var presenter: DetailUserPresenter!
    var interactor: MockDetailUserInteractor!
    var router: MockDetailUserRouter!
    var output: MockDetailUserPresenterOutputProtocol!
    
    override func setUp() {
        super.setUp()
        interactor = MockDetailUserInteractor()
        router = MockDetailUserRouter()
        output = MockDetailUserPresenterOutputProtocol()
        
        presenter = DetailUserPresenter(interactor: interactor, router: router)
        presenter.output = output
    }
    
    override func tearDown() {
        presenter = nil
        interactor = nil
        router = nil
        output = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        presenter.viewDidLoad()
        
        XCTAssertTrue(output.presentLoadingCalled)
    }
    
    func testViewWillAppear() {
        presenter.viewWillAppear()
        
        XCTAssertFalse(output.presentLoadingCalled)
        XCTAssertFalse(interactor.fetchCalled)
    }
    
    func testShowRepo() {
        presenter.user = "test"
        presenter.showRepo()
        
        XCTAssertTrue(router.presentReposCalled)
        XCTAssertEqual(router.presentReposUser, "test")
    }
}

// MARK: - Mock Classes

class MockDetailUserInteractor: DetailUserInteractorInputProtocol {
    var user: String = "test"
    var fetchCalled = false
    
    func fetch() {
        fetchCalled = true
    }
}

class MockDetailUserRouter: DetailUserRouter {
    var presentReposCalled = false
    var presentReposUser: String?
    
    override func presentRepos(user: String) {
        presentReposCalled = true
        presentReposUser = user
    }
}

class MockDetailUserPresenterOutputProtocol: DetailUserPresenterOutputProtocol {
    var updateUICalled = false
    var presentLoadingCalled = false
    var stopLoadingCalled = false
    var showViewOutInternetCalled = false
    var showViewErrorCalled = false
    
    func updateUI() {
        updateUICalled = true
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
