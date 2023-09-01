//
//  UsersManager.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

typealias UsersHandler = (([UsersModel]?) -> Void)

protocol UsersServiceProtocol {
    func get(completion: @escaping UsersHandler)
}

public class UsersService: UsersServiceProtocol {
    func get(completion: @escaping UsersHandler) {
        API.instance.getUsers(completion: { object in
            completion(object)
        })
    }
}
