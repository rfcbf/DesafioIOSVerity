//
//  RepoService.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

typealias RepoHandler = (([RepoModel]?) -> Void)

protocol RepoServiceProtocol {
    func get(user: String, completion: @escaping RepoHandler)
}

public class RepoService: RepoServiceProtocol {
    func get(user: String, completion: @escaping RepoHandler) {
        API.instance.getRepo(user: user, completion: { object in
            completion(object)
        })
    }
}
