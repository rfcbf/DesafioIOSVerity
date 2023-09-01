//
//  RepoModel.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

struct RepoModel: Codable {
    let name: String?
    let fullName: String?
    let htmlURL: URL?
    let createdAt: String?
    let visibility: String?

    private enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case htmlURL = "html_url"
        case createdAt = "created_at"
        case visibility
    }

    init(name: String? = nil,
         fullName: String? = nil,
         htmlURL: URL? = nil,
         createdAt: String? = nil,
         visibility: String? = nil) {
        self.name = name
        self.fullName = fullName
        self.htmlURL = htmlURL
        self.createdAt = createdAt
        self.visibility = visibility
    }
}
