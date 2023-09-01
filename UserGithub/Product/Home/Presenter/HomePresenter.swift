//
//  HomePresenter.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation
import UIKit

protocol HomePresenterInputProtocol {
    var count: Int { get }
    var title: String { get }
    
    func viewDidLoad()
    func viewWillAppear()
    func didSelectCell(at index: Int)
    func didSelectCellFiltred(user: UsersModel)
    func getUser(at index: Int) -> UsersModel
}

protocol HomePresenterOutputProtocol: AnyObject {
    func updateUIList()
    func presentLoading()
    func stopLoading()
    func showViewOutInternet()
    func showViewError()
}

class HomePresenter: HomePresenterInputProtocol {
    
    weak var output: HomePresenterOutputProtocol?
    var interactor: HomeInteractorInputProtocol
    var router: HomeRouter
    
    var navigationItem: UINavigationItem?
    
    var count: Int {
        return viewModel.count
    }
    
    var title: String = "GitHub - Usuários"

    var backButtonTitle: String {
        return ""
    }
    
    var viewModel: [UsersModel] = [] {
        didSet {
            output?.updateUIList()
        }
    }
    
    init(interactor: HomeInteractorInputProtocol,
         router: HomeRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        output?.presentLoading()
        loadData()
    }
    
    private func loadData() {
        DispatchQueue(label: "Fetch Users").async {
            if ReachabilityNotifier.instance.isNetworkAvailable {
                self.interactor.fetch()
            } else {
                self.output?.showViewOutInternet()
            }
        }
    }
    
    func viewWillAppear() {}
    
    func didSelectCell(at index: Int) {
        let user = self.getUser(at: index)
        guard let login = user.login else {
            self.output?.showViewError()
            return
        }
        
        router.presentPullRequests(login)
    }
    
    func didSelectCellFiltred(user: UsersModel) {
        guard let login = user.login else {
            self.output?.showViewError()
            return
        }
        
        router.presentPullRequests(login)
    }

    func getUser(at index: Int) -> UsersModel {
        if self.viewModel.count > 0 {
            let user = self.viewModel[index]
            return user
        } else {
            self.output?.showViewError()
        }
        
        return UsersModel()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {

    func fetched(users: [UsersModel]?) {
        guard let users = users else {
            self.output?.showViewError()
            return
        }
        self.viewModel = users
    }
}
