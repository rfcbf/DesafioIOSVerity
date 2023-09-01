//
//  UserViewCellControllerTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class UserViewCellControllerTests: XCTestCase {
    lazy var userViewCellController = UserViewCellController(delegate: mockDelegate)
    let mockDelegate = MockDelegate()
    let user = UsersModel()

    func testSetup() {
        
        userViewCellController.setup(user: user)
        
        XCTAssertEqual(mockDelegate.setUserUser?.login, nil)
    }
    
    func testSetData() {
        userViewCellController.setup(user: user)
        userViewCellController.setData()
        
        XCTAssertTrue(mockDelegate.setUserCalled)
        XCTAssertEqual(mockDelegate.setUserUser?.login, nil)
    }
}

class MockDelegate: UserCellDelegate {
    var setUserCalled = false
    var setUserUser: UsersModel?
    
    func setUser(user: UsersModel) {
        setUserCalled = true
        setUserUser = user
    }
}
