//
//  RepoRouterFactory.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation
import UIKit

class RepoRouterFactory {
    static func make(router: RepoRouter, user: String) -> UIViewController {

        let viewController = RepoViewController()
        
        let service = RepoService()
        let interactor = RepoInteractorBuilder.make(service: service, user: user)
        let presenter = RepoPresenterBuilder.make(interactor: interactor, router: router)
        
        interactor.output = presenter
        presenter.output = viewController
        presenter.user = user
        viewController.presenter = presenter
        
        return viewController
    }
}

