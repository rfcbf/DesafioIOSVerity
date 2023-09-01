//
//  UserViewCellTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class UserViewCellTests: XCTestCase {
    
    var tableView: UITableView!
    var cell: UserViewCell!
    
    override func setUp() {
        super.setUp()
        
        tableView = UITableView()
        tableView.register(UserViewCell.self, forCellReuseIdentifier: UserViewCell.cellIdentifier)
        
        cell = tableView.dequeueReusableCell(withIdentifier: UserViewCell.cellIdentifier) as? UserViewCell
    }
    
    override func tearDown() {
        tableView = nil
        cell = nil
        
        super.tearDown()
    }
    
    func testRegisterCell() {
        UserViewCell.registerCell(tableView: tableView)
        
        let registeredCell = tableView.dequeueReusableCell(withIdentifier: UserViewCell.cellIdentifier)
        
        XCTAssertNotNil(registeredCell)
        XCTAssertTrue(registeredCell is UserViewCell)
    }
    
    func testInitWidgets() {
        cell.initWidgets()
        
        XCTAssertNotNil(cell.userView)
        XCTAssertNotNil(cell.bottomSeparator)
    }
    
    func testAddViews() {
        cell.initWidgets()
        cell.addViews()
        
        XCTAssertTrue(cell.subviews.contains(cell.userView))
        XCTAssertTrue(cell.subviews.contains(cell.bottomSeparator))
    }
}
