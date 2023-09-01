//
//  DetailUserPresenter.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation
import UIKit

protocol DetailUserPresenterInputProtocol {
    var title: String { get }
    
    func viewDidLoad()
    func viewWillAppear()
    func showRepo()
}

protocol DetailUserPresenterOutputProtocol: AnyObject {
    func updateUI()
    func presentLoading()
    func stopLoading()
    func showViewOutInternet()
    func showViewError()
}

class DetailUserPresenter: DetailUserPresenterInputProtocol {
    
    weak var output: DetailUserPresenterOutputProtocol?
    var interactor: DetailUserInteractorInputProtocol
    var router: DetailUserRouter
    
    var navigationItem: UINavigationItem?
    
    var user: String = ""
    var title: String = ""

    var viewModel: DetailUserModel = DetailUserModel() {
        didSet {
            output?.updateUI()
        }
    }
    
    var backButtonTitle: String {
        return ""
    }

    init(interactor: DetailUserInteractorInputProtocol,
         router: DetailUserRouter) {
        self.interactor = interactor
        self.router = router
        self.title = "Dados do usuário"
    }

    func viewDidLoad() {
        output?.presentLoading()
        loadData()
    }
    
    func viewWillAppear() {}

    private func loadData() {
        DispatchQueue(label: "Fetch detail user").async {
            if ReachabilityNotifier.instance.isNetworkAvailable {
                self.interactor.fetch()
            } else {
                self.output?.showViewOutInternet()
            }
        }
    }
    
    func showRepo() {
        router.presentRepos(user: user)
    }
}

extension DetailUserPresenter: DetailUserInteractorOutputProtocol {
    func fetched(_ user: DetailUserModel?) {
        guard let _ = user?.login else {
            self.output?.showViewError()
            return
        }
        
        guard let user = user else { return }
        self.viewModel = user
    }
}
