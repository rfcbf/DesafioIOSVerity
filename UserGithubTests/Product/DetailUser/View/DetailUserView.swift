//
//  DetailUserView.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class DetailUserViewTests: XCTestCase {
    
    var detailUserView: DetailUserView!
    
    override func setUp() {
        super.setUp()
        detailUserView = DetailUserView()
    }
    
    override func tearDown() {
        detailUserView = nil
        super.tearDown()
    }
    
    func testContainerProfileView() {
        XCTAssertNotNil(detailUserView.containerProfileView)
        XCTAssertEqual(detailUserView.containerProfileView.backgroundColor, .black)
        XCTAssertEqual(detailUserView.containerProfileView.subviews.count, 3)
        XCTAssertTrue(detailUserView.containerProfileView.subviews.contains(detailUserView.avatar))
        XCTAssertTrue(detailUserView.containerProfileView.subviews.contains(detailUserView.loginLabel))
        XCTAssertTrue(detailUserView.containerProfileView.subviews.contains(detailUserView.nameLabel))
    }
    
    func testContainerInfoView() {
        XCTAssertNotNil(detailUserView.containerInfoView)
        XCTAssertEqual(detailUserView.containerInfoView.subviews.count, 1)
        XCTAssertTrue(detailUserView.containerInfoView.subviews.contains(detailUserView.infoStackView))
    }
    
    func testContainerMoreView() {
        XCTAssertNotNil(detailUserView.containerMoreView)
        XCTAssertEqual(detailUserView.containerMoreView.subviews.count, 6)
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.compantLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.blogLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.locationLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.twitterLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.createLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.updateLabel))
    }
    
    func testInfoStackView() {
        XCTAssertNotNil(detailUserView.infoStackView)
        XCTAssertEqual(detailUserView.infoStackView.axis, .horizontal)
        XCTAssertEqual(detailUserView.infoStackView.spacing, 16)
        XCTAssertEqual(detailUserView.infoStackView.distribution, .fillEqually)
        XCTAssertEqual(detailUserView.infoStackView.alignment, .center)
        XCTAssertEqual(detailUserView.infoStackView.arrangedSubviews.count, 3)
        XCTAssertTrue(detailUserView.infoStackView.arrangedSubviews[0].isKind(of: UIView.self))
        XCTAssertTrue(detailUserView.infoStackView.arrangedSubviews[1].isKind(of: UIView.self))
        XCTAssertTrue(detailUserView.infoStackView.arrangedSubviews[2].isKind(of: UIView.self))
    }
    
    func testScrollView() {
        XCTAssertNotNil(detailUserView.scrollView)
        XCTAssertEqual(detailUserView.scrollView.contentSize.width, UIScreen.main.bounds.width)
        XCTAssertEqual(detailUserView.scrollView.contentSize.height, UIScreen.main.bounds.height)
        XCTAssertFalse(detailUserView.scrollView.translatesAutoresizingMaskIntoConstraints)
    }
    
    func testAvatar() {
        XCTAssertNotNil(detailUserView.avatar)
        XCTAssertEqual(detailUserView.avatar.contentMode, .scaleAspectFill)
        XCTAssertTrue(detailUserView.avatar.clipsToBounds)
        XCTAssertEqual(detailUserView.avatar.layer.borderWidth, 3)
        XCTAssertEqual(detailUserView.avatar.layer.borderColor, UIColor.white.cgColor)
    }
    
    func testLoginLabel() {
        XCTAssertNotNil(detailUserView.loginLabel)
        XCTAssertEqual(detailUserView.loginLabel.textAlignment, .center)
        XCTAssertEqual(detailUserView.loginLabel.font, UIFont.boldSystemFont(ofSize: 26))
        XCTAssertEqual(detailUserView.loginLabel.textColor, .white)
    }
    
    func testNameLabel() {
        XCTAssertNotNil(detailUserView.nameLabel)
        XCTAssertEqual(detailUserView.nameLabel.textAlignment, .center)
        XCTAssertEqual(detailUserView.nameLabel.font, UIFont.systemFont(ofSize: 18))
        XCTAssertEqual(detailUserView.nameLabel.textColor, .white)
    }
    
    func testPublicReposLabel() {
        XCTAssertNotNil(detailUserView.publicReposLabel)
        XCTAssertEqual(detailUserView.publicReposLabel.textAlignment, .center)
        XCTAssertEqual(detailUserView.publicReposLabel.font, UIFont.systemFont(ofSize: 14))
        XCTAssertEqual(detailUserView.publicReposLabel.textColor, .white)
        XCTAssertEqual(detailUserView.publicReposLabel.numberOfLines, 0)
    }
    
    func testPublicGistsLabel() {
        XCTAssertNotNil(detailUserView.publicGistsLabel)
        XCTAssertEqual(detailUserView.publicGistsLabel.textAlignment, .center)
        XCTAssertEqual(detailUserView.publicGistsLabel.font, UIFont.systemFont(ofSize: 14))
        XCTAssertEqual(detailUserView.publicGistsLabel.textColor, .white)
        XCTAssertEqual(detailUserView.publicGistsLabel.numberOfLines, 0)
    }
    
    func testFollowersLabel() {
        XCTAssertNotNil(detailUserView.followersLabel)
        XCTAssertEqual(detailUserView.followersLabel.textAlignment, .center)
        XCTAssertEqual(detailUserView.followersLabel.font, UIFont.systemFont(ofSize: 14))
        XCTAssertEqual(detailUserView.followersLabel.textColor, .white)
        XCTAssertEqual(detailUserView.followersLabel.numberOfLines, 0)
    }
    
    func testCompantLabel() {
        XCTAssertNotNil(detailUserView.compantLabel)
        XCTAssertEqual(detailUserView.compantLabel.textAlignment, .left)
        XCTAssertEqual(detailUserView.compantLabel.font, UIFont.systemFont(ofSize: 14))
        XCTAssertEqual(detailUserView.compantLabel.textColor, .black)
        XCTAssertEqual(detailUserView.compantLabel.numberOfLines, 0)
    }
    
    func testBlogLabel() {
        XCTAssertNotNil(detailUserView.blogLabel)
        XCTAssertEqual(detailUserView.blogLabel.textAlignment, .left)
        XCTAssertEqual(detailUserView.blogLabel.font, UIFont.systemFont(ofSize: 14))
        XCTAssertEqual(detailUserView.blogLabel.textColor, .black)
        XCTAssertEqual(detailUserView.blogLabel.numberOfLines, 1)
    }
    
    func testLocationLabel() {
        XCTAssertNotNil(detailUserView.locationLabel)
        XCTAssertEqual(detailUserView.locationLabel.textAlignment, .left)
        XCTAssertEqual(detailUserView.locationLabel.font, UIFont.systemFont(ofSize: 14))
        XCTAssertEqual(detailUserView.locationLabel.textColor, .black)
        XCTAssertEqual(detailUserView.locationLabel.numberOfLines, 1)
    }
    
    func testTwitterLabel() {
        XCTAssertNotNil(detailUserView.twitterLabel)
        XCTAssertEqual(detailUserView.twitterLabel.textAlignment, .left)
        XCTAssertEqual(detailUserView.twitterLabel.font, UIFont.systemFont(ofSize: 14))
        XCTAssertEqual(detailUserView.twitterLabel.textColor, .black)
        XCTAssertEqual(detailUserView.twitterLabel.numberOfLines, 1)
    }
    
    func testCreateLabel() {
        XCTAssertNotNil(detailUserView.createLabel)
        XCTAssertEqual(detailUserView.createLabel.textAlignment, .left)
        XCTAssertEqual(detailUserView.createLabel.font, UIFont.systemFont(ofSize: 14))
        XCTAssertEqual(detailUserView.createLabel.textColor, .black)
        XCTAssertEqual(detailUserView.createLabel.numberOfLines, 1)
    }
    
    func testUpdateLabel() {
        XCTAssertNotNil(detailUserView.updateLabel)
        XCTAssertEqual(detailUserView.updateLabel.textAlignment, .left)
        XCTAssertEqual(detailUserView.updateLabel.font, UIFont.systemFont(ofSize: 14))
        XCTAssertEqual(detailUserView.updateLabel.textColor, .black)
        XCTAssertEqual(detailUserView.updateLabel.numberOfLines, 1)
    }
    
    func testSetup() {
        let user = DetailUserModel()
        detailUserView.setup(user: user)
        XCTAssertEqual(detailUserView.subviews.count, 1)
        XCTAssertTrue(detailUserView.subviews.contains(detailUserView.scrollView))
        XCTAssertEqual(detailUserView.containerProfileView.subviews.count, 3)
        XCTAssertTrue(detailUserView.containerProfileView.subviews.contains(detailUserView.avatar))
        XCTAssertTrue(detailUserView.containerProfileView.subviews.contains(detailUserView.loginLabel))
        XCTAssertTrue(detailUserView.containerProfileView.subviews.contains(detailUserView.nameLabel))
        XCTAssertEqual(detailUserView.containerInfoView.subviews.count, 1)
        XCTAssertTrue(detailUserView.containerInfoView.subviews.contains(detailUserView.infoStackView))
        XCTAssertEqual(detailUserView.containerMoreView.subviews.count, 6)
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.compantLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.blogLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.locationLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.twitterLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.createLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.updateLabel))
    }
    
    func testTraitCollectionDidChange() {
        let previousTraitCollection = UITraitCollection()
        detailUserView.traitCollectionDidChange(previousTraitCollection)
        XCTAssertEqual(detailUserView.subviews.count, 0)
        XCTAssertEqual(detailUserView.containerProfileView.subviews.count, 3)
        XCTAssertTrue(detailUserView.containerProfileView.subviews.contains(detailUserView.avatar))
        XCTAssertTrue(detailUserView.containerProfileView.subviews.contains(detailUserView.loginLabel))
        XCTAssertTrue(detailUserView.containerProfileView.subviews.contains(detailUserView.nameLabel))
        XCTAssertEqual(detailUserView.containerInfoView.subviews.count, 1)
        XCTAssertTrue(detailUserView.containerInfoView.subviews.contains(detailUserView.infoStackView))
        XCTAssertEqual(detailUserView.containerMoreView.subviews.count, 6)
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.compantLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.blogLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.locationLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.twitterLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.createLabel))
        XCTAssertTrue(detailUserView.containerMoreView.subviews.contains(detailUserView.updateLabel))
    }
}
