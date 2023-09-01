//
//  RepoViewCellTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class RepoViewCellTests: XCTestCase {

    var tableView: UITableView!
    var cell: RepoViewCell!
    
    override func setUp() {
        super.setUp()
        
        tableView = UITableView()
        tableView.register(RepoViewCell.self, forCellReuseIdentifier: RepoViewCell.cellIdentifier)
        
        cell = tableView.dequeueReusableCell(withIdentifier: RepoViewCell.cellIdentifier) as? RepoViewCell
    }
    
    override func tearDown() {
        tableView = nil
        cell = nil
        
        super.tearDown()
    }
    
    func testRegisterCell() {
        RepoViewCell.registerCell(tableView: tableView)
        
        let registeredCell = tableView.dequeueReusableCell(withIdentifier: RepoViewCell.cellIdentifier)
        
        XCTAssertNotNil(registeredCell)
        XCTAssertTrue(registeredCell is RepoViewCell)
    }
    
    func testInitWidgets() {
        cell.initWidgets()
        
        XCTAssertNotNil(cell.repoView)
        XCTAssertNotNil(cell.bottomSeparator)
    }
}
