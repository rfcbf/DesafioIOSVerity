import Foundation

struct DetailUserModel: Codable {
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
    let name: String?
    let company: String?
    let blog: String?
    let location: String?
    let email: String?
    let hireable: String?
    let bio: String?
    let twitterUsername: String?
    let publicRepos: Int?
    let publicGists: Int?
    let followers: Int?
    let following: Int?
    let createdAt: String?
    let updatedAt: String?

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
        case name
        case company
        case blog
        case location
        case email
        case hireable
        case bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers
        case following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
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
         siteAdmin: Bool? = nil,
         name: String? = nil,
         company: String? = nil,
         blog: String? = nil,
         location: String? = nil,
         email: String? = nil,
         hireable: String? = nil,
         bio: String? = nil,
         twitterUsername: String? = nil,
         publicRepos: Int? = nil,
         publicGists: Int? = nil,
         followers: Int? = nil,
         following: Int? = nil,
         createdAt: String? = nil,
         updatedAt: String? = nil) {
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
        self.name = name
        self.company = company
        self.blog = blog
        self.location = location
        self.email = email
        self.hireable = hireable
        self.bio = bio
        self.twitterUsername = twitterUsername
        self.publicRepos = publicRepos
        self.publicGists = publicGists
        self.followers = followers
        self.following = following
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
