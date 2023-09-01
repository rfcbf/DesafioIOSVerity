//
//  RepoPresenterBuilder.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

class RepoPresenterBuilder {
    
    static func make(interactor: RepoInteractorInputProtocol, router: RepoRouter) -> RepoPresenter {
        let presenter = RepoPresenter(interactor: interactor, router: router)
        return presenter
    }
}
