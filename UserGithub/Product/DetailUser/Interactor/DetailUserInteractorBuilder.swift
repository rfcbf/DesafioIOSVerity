//
//  DetailUserInteractorBuilder.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

class DetailUserInteractorBuilder {
    static func make(service: DetailUsersService, user: String) -> DetailUserInteractor {
        return DetailUserInteractor(service: service, user: user)
    }
}
