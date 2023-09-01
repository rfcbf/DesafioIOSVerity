//
//  DetailUserViewControllerTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class DetailUserViewControllerTests: XCTestCase {
    
    var viewController: DetailUserViewController!
    var presenter: MockDetailUserPresenter!
    var mockDetaiUserInteractorProtocol = MockDetailUserInteractor()
    var mockHomeRouter = MockDetailUserRouter()

    override func setUp() {
        super.setUp()
        viewController = DetailUserViewController()
        presenter = MockDetailUserPresenter(interactor: mockDetaiUserInteractorProtocol,
                                            router: mockHomeRouter)
        viewController.presenter = presenter
    }
    
    override func tearDown() {
        viewController = nil
        presenter = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        viewController.viewDidLoad()
        XCTAssertTrue(presenter.viewDidLoadCalled)
    }
    
    func testViewWillAppear() {
        viewController.viewWillAppear(true)
        XCTAssertTrue(presenter.viewWillAppearCalled)
    }
    
    func testPreferredStatusBarStyle() {
        let statusBarStyle = viewController.preferredStatusBarStyle
        XCTAssertEqual(statusBarStyle, .lightContent)
    }
    
    func testSetUpView() {
        let user = DetailUserModel()
        viewController.setUpView(user)
        XCTAssertTrue(viewController.view.subviews.contains(where: { $0 is DetailUserView }))
    }
    
    func testSetUpNavigation() {
        viewController.setUpNavigation()
        XCTAssertEqual(viewController.title, presenter.title)
        XCTAssertEqual(viewController.navigationItem.backButtonTitle, presenter.backButtonTitle)
    }
    
    func testAddTapped() {
        viewController.addTapped()
        XCTAssertTrue(presenter.showRepoCalled)
    }
}

class MockDetailUserPresenter: DetailUserPresenter {
    
    var viewDidLoadCalled = false
    var viewWillAppearCalled = false
    var showRepoCalled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDidLoadCalled = true
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        viewWillAppearCalled = true
    }
    
    override func showRepo() {
        super.showRepo()
        showRepoCalled = true
    }
}
