//
//  DetailRouterFactory.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation
import UIKit

class DetailRouterFactory {
    static func make(router: DetailUserRouter, user: String) -> UIViewController {

        let viewController = DetailUserViewController()
        
        let service = DetailUsersService()
        let interactor = DetailUserInteractorBuilder.make(service: service, user: user)
        let presenter = DetailPresenterBuilder.make(interactor: interactor, router: router)
        
        interactor.output = presenter
        presenter.output = viewController
        presenter.user = user
        viewController.presenter = presenter
        
        return viewController
    }
}
