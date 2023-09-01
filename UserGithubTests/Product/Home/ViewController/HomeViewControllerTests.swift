//
//  HomeViewControllerTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController!
    var mockPresenter: MockHomePresenter!
    var mockHomeInteractorProtocol = MockHomeInteractor()
    var mockHomeRouter = MockHomeRouter()
    
    override func setUp() {
        super.setUp()
        sut = HomeViewController()
        
        
        mockPresenter = MockHomePresenter(interactor: mockHomeInteractorProtocol,
                                          router: mockHomeRouter)
        sut.presenter = mockPresenter
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testViewDidLoad_ShouldCallPresenterViewDidLoad() {
        // Arrange

        // Act
        sut.viewDidLoad()

        // Assert
        XCTAssertTrue(mockPresenter.isViewDidLoadCalled)
    }

    func testViewWillAppear_ShouldCallPresenterViewWillAppear() {
        // Arrange

        // Act
        sut.viewWillAppear(true)

        // Assert
        XCTAssertTrue(mockPresenter.isViewWillAppearCalled)
    }

    func testViewWillAppear_ShouldReloadTableView() {
        // Arrange
        let mockTableView = MockTableView()
        sut.tableView = mockTableView

        // Act
        sut.viewWillAppear(true)

        // Assert
        XCTAssertTrue(mockTableView.isReloadDataCalled)
    }

    func testPreferredStatusBarStyle_ShouldReturnLightContent() {
        // Arrange

        // Act
        let statusBarStyle = sut.preferredStatusBarStyle

        // Assert
        XCTAssertEqual(statusBarStyle, .lightContent)
    }
}

class MockHomePresenter: HomePresenter {
    
    var isViewDidLoadCalled = false
    var isViewWillAppearCalled = false

    override func viewDidLoad() {
        isViewDidLoadCalled = true
    }

    override func viewWillAppear() {
        isViewWillAppearCalled = true
    }
}

class MockTableView: UITableView {
    
    var isReloadDataCalled = false
    
    override func reloadData() {
        isReloadDataCalled = true
    }
}
