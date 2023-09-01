//
//  RepoViewTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class RepoViewTests: XCTestCase {
    
    var repoView: RepoView!
    let repo = RepoModel(name: "teste",
                         fullName: "Teste",
                         htmlURL: URL(string: "https://www.example.com"),
                         createdAt: "2023-08-30",
                         visibility: "Public")

    override func setUp() {
        super.setUp()
        repoView = RepoView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    override func tearDown() {
        repoView = nil
        super.tearDown()
    }
    
    func testSetup() {
        repoView.setup(repo: repo)
        
        XCTAssertEqual(repoView.repoNameLabel.text, "teste")
        XCTAssertEqual(repoView.nameLabel.text, "Teste")
        XCTAssertEqual(repoView.linkLabel.text, "https://www.example.com")
        XCTAssertEqual(repoView.createdAtLabel.text, "Criado em: 2023-08-30")
        XCTAssertEqual(repoView.visibilityLabel.text, "Visível para: Public")
    }
    
    func testInitWithFrame() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let repoView = RepoView(frame: frame)
        
        XCTAssertEqual(repoView.frame, frame)
        XCTAssertEqual(repoView.subviews.count, 1)
        XCTAssertTrue(repoView.subviews.contains(repoView.containerView))
    }
    
    func testInit() {
        let repoView = RepoView()
        
        XCTAssertEqual(repoView.frame, CGRect())
        XCTAssertEqual(repoView.subviews.count, 1)
        XCTAssertTrue(repoView.subviews.contains(repoView.containerView))
    }
    
    func testDraw() {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        repoView.draw(rect)
        
        XCTAssertEqual(repoView.frame, rect)
        XCTAssertEqual(repoView.subviews.count, 1)
        XCTAssertTrue(repoView.subviews.contains(repoView.containerView))
    }
}
