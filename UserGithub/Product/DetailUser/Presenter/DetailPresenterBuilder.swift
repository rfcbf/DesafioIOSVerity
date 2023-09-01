//
//  DetailPresenterBuilder.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

class DetailPresenterBuilder {
    
    static func make(interactor: DetailUserInteractorInputProtocol, router: DetailUserRouter) -> DetailUserPresenter {
        let presenter = DetailUserPresenter(interactor: interactor, router: router)
        return presenter
    }
}
