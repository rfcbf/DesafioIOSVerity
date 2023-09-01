//
//  DetailUserServer.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

typealias DetailUsersHandler = ((DetailUserModel?) -> Void)

protocol DeatilUsersServiceProtocol {
    func get(user: String, completion: @escaping DetailUsersHandler)
}

public class DetailUsersService: DeatilUsersServiceProtocol {
    func get(user: String, completion: @escaping DetailUsersHandler) {
        API.instance.getDeatilUsers(user: user, completion: { object in
            completion(object)
        })
    }
}
