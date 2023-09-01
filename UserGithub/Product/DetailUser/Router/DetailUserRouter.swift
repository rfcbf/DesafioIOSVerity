//
//  DetailUserRouter.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit

class DetailUserRouter {
    var navigationController: UINavigationController?
    var user: String = ""

    func present(navigationController: UINavigationController, user: String) {
        self.user = user
        self.navigationController = navigationController
        navigationController.pushViewController(DetailRouterFactory.make(router: self, user: user), animated: true)
    }
    
    func presentRepos(user: String) {
        guard let navigation = self.navigationController else { return }
        RepoRouter().present(navigationController: navigation, user: user)
    }
}
