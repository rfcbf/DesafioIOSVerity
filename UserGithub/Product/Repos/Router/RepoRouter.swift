//
//  RepoRouter.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit

class RepoRouter {
    var navigationController: UINavigationController?
    var user: String = ""

    func present(navigationController: UINavigationController, user: String) {
        self.user = user
        self.navigationController = navigationController
        navigationController.pushViewController(RepoRouterFactory.make(router: self, user: user), animated: true)
    }
}
