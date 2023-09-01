//
//  APIBuilder.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

public class APIBuilder {

    private var url: String
    
    public init() {
        url = "https://api.github.com"
    }
    
    func getUsers() -> APIBuilder {
        self.url += "/users"
        return self
    }

    func getDetailUser(user: String) -> APIBuilder {
        self.url += "/users/" + user
        return self
    }
    
    func getRepos(user: String) -> APIBuilder {
        self.url += "/users/" + user + "/repos"
        return self
    }

    func buildURL() -> String {
        return self.url
    }
}
