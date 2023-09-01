//
//  HomeInteractorBuilder.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

class HomeInteractorBuilder {
    static func make(service: UsersService) -> HomeInteractor {
        return HomeInteractor(service: service)
    }
}
