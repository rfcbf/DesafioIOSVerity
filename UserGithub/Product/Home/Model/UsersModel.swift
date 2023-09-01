//
//  UsersModel.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

struct UsersModel: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: URL?
    let gravatarID: String?
    let url: URL?
    let htmlURL: URL?
    let followersURL: URL?
    let followingURL: String?
    let gistsURL: String?
    let starredURL: String?
    let subscriptionsURL: URL?
    let organizationsURL: URL?
    let reposURL: URL?
    let eventsURL: String?
    let receivedEventsURL: URL?
    let type: String?
    let siteAdmin: Bool?

    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
    
    init(login: String? = nil,
         id: Int? = nil,
         nodeID: String? = nil,
         avatarURL: URL? = nil,
         gravatarID: String? = nil,
         url: URL? = nil,
         htmlURL: URL? = nil,
         followersURL: URL? = nil,
         followingURL: String? = nil,
         gistsURL: String? = nil,
         starredURL: String? = nil,
         subscriptionsURL: URL? = nil,
         organizationsURL: URL? = nil,
         reposURL: URL? = nil,
         eventsURL: String? = nil,
         receivedEventsURL: URL? = nil,
         type: String? = nil,
         siteAdmin: Bool? = nil) {
        self.login = login
        self.id = id
        self.nodeID = nodeID
        self.avatarURL = avatarURL
        self.gravatarID = gravatarID
        self.url = url
        self.htmlURL = htmlURL
        self.followersURL = followersURL
        self.followingURL = followingURL
        self.gistsURL = gistsURL
        self.starredURL = starredURL
        self.subscriptionsURL = subscriptionsURL
        self.organizationsURL = organizationsURL
        self.reposURL = reposURL
        self.eventsURL = eventsURL
        self.receivedEventsURL = receivedEventsURL
        self.type = type
        self.siteAdmin = siteAdmin
    }
}
