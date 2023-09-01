//
//  UsersModelTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class UsersModelTests: XCTestCase {
    
    func testUsersModelInitialization() {
        let login = "teste"
        let id = 1
        let nodeID = ""
        let avatarURL = URL(string: "https://google.com.br/")
        let gravatarID = "123"
        let url = URL(string: "https://google.com.br/")
        let htmlURL = URL(string: "https://google.com.br/")
        let followersURL = URL(string: "https://google.com.br/")
        let followingURL = "https://google.com.br/"
        let gistsURL = "https://google.com.br/"
        let starredURL = "https://example.com/user/starred"
        let subscriptionsURL = URL(string: "https://google.com.br/")
        let organizationsURL = URL(string: "https://google.com.br/")
        let reposURL = URL(string: "https://google.com.br/")
        let eventsURL = "https://google.com.br/"
        let receivedEventsURL = URL(string: "https://google.com.br/")
        let type = "User"
        let siteAdmin = false
        
        let userModel = UsersModel(login: login,
                                   id: id,
                                   nodeID: nodeID,
                                   avatarURL: avatarURL,
                                   gravatarID: gravatarID,
                                   url: url,
                                   htmlURL: htmlURL,
                                   followersURL: followersURL,
                                   followingURL: followingURL,
                                   gistsURL: gistsURL,
                                   starredURL: starredURL,
                                   subscriptionsURL: subscriptionsURL,
                                   organizationsURL: organizationsURL,
                                   reposURL: reposURL,
                                   eventsURL: eventsURL,
                                   receivedEventsURL: receivedEventsURL,
                                   type: type,
                                   siteAdmin: siteAdmin)
        
        XCTAssertEqual(userModel.login, login)
        XCTAssertEqual(userModel.id, id)
        XCTAssertEqual(userModel.nodeID, nodeID)
        XCTAssertEqual(userModel.avatarURL, avatarURL)
        XCTAssertEqual(userModel.gravatarID, gravatarID)
        XCTAssertEqual(userModel.url, url)
        XCTAssertEqual(userModel.htmlURL, htmlURL)
        XCTAssertEqual(userModel.followersURL, followersURL)
        XCTAssertEqual(userModel.followingURL, followingURL)
        XCTAssertEqual(userModel.gistsURL, gistsURL)
        XCTAssertEqual(userModel.starredURL, starredURL)
        XCTAssertEqual(userModel.subscriptionsURL, subscriptionsURL)
        XCTAssertEqual(userModel.organizationsURL, organizationsURL)
        XCTAssertEqual(userModel.reposURL, reposURL)
        XCTAssertEqual(userModel.eventsURL, eventsURL)
        XCTAssertEqual(userModel.receivedEventsURL, receivedEventsURL)
        XCTAssertEqual(userModel.type, type)
        XCTAssertEqual(userModel.siteAdmin, siteAdmin)
    }
}
