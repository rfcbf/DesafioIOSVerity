//
//  HomeRouterFactory.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation
import UIKit

class HomeRouterFactory {
    static func make(router: HomeRouter) -> UIViewController? {

        let viewController = HomeViewController()
        
        let service = UsersService()
        let interactor = HomeInteractorBuilder.make(service: service)
        let presenter = HomePresenterBuilder.make(interactor: interactor, router: router)
        
        interactor.output = presenter
        presenter.output = viewController
        viewController.presenter = presenter
        
        return viewController
    }
}
