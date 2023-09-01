//
//  HomePresenterBuilder.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

class HomePresenterBuilder {
    
    static func make(interactor: HomeInteractorInputProtocol, router: HomeRouter) -> HomePresenter {
        let presenter = HomePresenter(interactor: interactor, router: router)
        
        return presenter
    }
}
