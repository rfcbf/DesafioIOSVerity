//
//  DetailUserModelTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class DetailUserModelTests: XCTestCase {
    
    func testInit() {
        let userModel = DetailUserModel(login: "teste",
                                        id: 1,
                                        nodeID: "abc123",
                                        avatarURL: nil,
                                        gravatarID: "abc123",
                                        url: nil,
                                        htmlURL: nil,
                                        followersURL: nil,
                                        followingURL: nil,
                                        gistsURL: nil,
                                        starredURL: nil,
                                        subscriptionsURL: nil,
                                        organizationsURL: nil,
                                        reposURL: nil,
                                        eventsURL: nil,
                                        receivedEventsURL: nil,
                                        type: "User",
                                        siteAdmin: false,
                                        name: "Teste",
                                        company: "Company",
                                        blog: nil,
                                        location: nil,
                                        email: "teste@teste.com",
                                        hireable: nil,
                                        bio: nil,
                                        twitterUsername: "teste",
                                        publicRepos: 1,
                                        publicGists: 1,
                                        followers: 1,
                                        following: 1,
                                        createdAt: "2021-01-01",
                                        updatedAt: "2021-02-01")
        
        XCTAssertEqual(userModel.login, "teste")
        XCTAssertEqual(userModel.id, 1)
        XCTAssertEqual(userModel.nodeID, "abc123")
        XCTAssertNil(userModel.avatarURL)
        XCTAssertEqual(userModel.gravatarID, "abc123")
        XCTAssertNil(userModel.url)
        XCTAssertNil(userModel.htmlURL)
        XCTAssertNil(userModel.followersURL)
        XCTAssertNil(userModel.followingURL)
        XCTAssertNil(userModel.gistsURL)
        XCTAssertNil(userModel.starredURL)
        XCTAssertNil(userModel.subscriptionsURL)
        XCTAssertNil(userModel.organizationsURL)
        XCTAssertNil(userModel.reposURL)
        XCTAssertNil(userModel.eventsURL)
        XCTAssertNil(userModel.receivedEventsURL)
        XCTAssertEqual(userModel.type, "User")
        XCTAssertEqual(userModel.siteAdmin, false)
        XCTAssertEqual(userModel.name, "Teste")
        XCTAssertEqual(userModel.company, "Company")
        XCTAssertNil(userModel.blog)
        XCTAssertNil(userModel.location)
        XCTAssertEqual(userModel.email, "teste@teste.com")
        XCTAssertNil(userModel.hireable)
        XCTAssertNil(userModel.bio)
        XCTAssertEqual(userModel.twitterUsername, "teste")
        XCTAssertEqual(userModel.publicRepos, 1)
        XCTAssertEqual(userModel.publicGists, 1)
        XCTAssertEqual(userModel.followers, 1)
        XCTAssertEqual(userModel.following, 1)
        XCTAssertEqual(userModel.createdAt, "2021-01-01")
        XCTAssertEqual(userModel.updatedAt, "2021-02-01")
    }
    
}
