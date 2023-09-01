//
//  RepoInteractorBuilder.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

class RepoInteractorBuilder {
    static func make(service: RepoService, user: String) -> RepoInteractor {
        return RepoInteractor(service: service, user: user)
    }
}
