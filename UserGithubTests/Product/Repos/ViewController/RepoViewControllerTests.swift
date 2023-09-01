//
//  RepoViewControllerTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class RepoViewControllerTests: XCTestCase {
    
    var sut: RepoViewController!
    var mockPresenter: MockRepoPresenter!
    var mockRepoInteractorProtocol = MockRepoInteractor()
    var mockRepoRouter = MockRepoRouter()
    
    override func setUp() {
        super.setUp()
        sut = RepoViewController()
        mockPresenter = MockRepoPresenter(interactor: mockRepoInteractorProtocol,
                                          router: mockRepoRouter)
        sut.presenter = mockPresenter
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        mockPresenter = nil
        super.tearDown()
    }
    
    func testViewDidLoad_ShouldCallPresenterViewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(mockPresenter.viewDidLoadCalled)
    }
    
    func testViewWillAppear_ShouldCallPresenterViewWillAppear() {
        sut.viewWillAppear(false)
        XCTAssertTrue(mockPresenter.viewWillAppearCalled)
    }
    
    func testPreferredStatusBarStyle_ShouldReturnLightContent() {
        let statusBarStyle = sut.preferredStatusBarStyle
        XCTAssertEqual(statusBarStyle, .lightContent)
    }
}

class MockRepoPresenter: RepoPresenter {
    var viewDidLoadCalled = false
    var viewWillAppearCalled = false
    
    override func viewDidLoad() {
        viewDidLoadCalled = true
    }
    
    override func viewWillAppear() {
        viewWillAppearCalled = true
    }
}
