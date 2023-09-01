//
//  RepoPresenter.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation
import UIKit

protocol RepoPresenterInputProtocol {
    var count: Int { get }
    var title: String { get }
    
    func viewDidLoad()
    func viewWillAppear()
    func getRepo(at index: Int) -> RepoModel
}

protocol RepoPresenterOutputProtocol: AnyObject {
    func updateUIList()
    func presentLoading()
    func stopLoading()
    func showViewOutInternet()
    func showViewError()
}

class RepoPresenter: RepoPresenterInputProtocol {
    
    weak var output: RepoPresenterOutputProtocol?
    var interactor: RepoInteractorInputProtocol
    var router: RepoRouter
    
    var navigationItem: UINavigationItem?
    
    var count: Int {
        return viewModel.count
    }
    
    var title: String = ""
    var user: String = ""
    
    var viewModel: [RepoModel] = [] {
        didSet {
            output?.updateUIList()
        }
    }
    
    init(interactor: RepoInteractorInputProtocol,
         router: RepoRouter) {
        self.interactor = interactor
        self.router = router
        self.title = "Repositórios"
    }
    
    func viewDidLoad() {
        output?.presentLoading()
        loadData()
    }
    
    func viewWillAppear() {}

    private func loadData() {
        DispatchQueue(label: "Fetch Repos").async {
            if ReachabilityNotifier.instance.isNetworkAvailable {
                self.interactor.fetch()
            } else {
                self.output?.showViewOutInternet()
            }
        }
    }
    
    func getRepo(at index: Int) -> RepoModel {
        if self.viewModel.count > 0 {
            let repo = self.viewModel[index]
            return repo
        } else {
            self.output?.showViewError()
        }
        
        return RepoModel()
    }
}

extension RepoPresenter: RepoInteractorOutputProtocol {
    func fetched(_ repo: [RepoModel]?) {
        guard let repos = repo else {
            self.output?.showViewError()
            return
        }
        self.viewModel = repos
    }
}
