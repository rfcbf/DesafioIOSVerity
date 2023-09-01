//
//  HomeRouter.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit

class HomeRouter {
    var navigationController: UINavigationController?
    
    func present(in window: UIWindow) {
        window.makeKeyAndVisible()
        
        guard let viewController = HomeRouterFactory.make(router: self) else { return }
        
        navigationController = UINavigationController(rootViewController: viewController)
        navigationController?.setupNavBarColor()

        window.rootViewController = navigationController
    }
    
    func presentPullRequests(_ user: String) {
        guard let navigationController = self.navigationController else { return }
        DetailUserRouter().present(navigationController: navigationController, user: user)
    }
}
