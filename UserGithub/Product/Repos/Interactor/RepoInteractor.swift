//
//  RepoInteractor.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

protocol RepoInteractorInputProtocol {
    var user: String { get }
    
    func fetch()
}

protocol RepoInteractorOutputProtocol: AnyObject {
    func fetched(_ repo: [RepoModel]?)
}

class RepoInteractor: RepoInteractorInputProtocol {

    weak var output: RepoInteractorOutputProtocol?
    private var service: RepoServiceProtocol
    let user: String
    
    init(service: RepoServiceProtocol, user: String) {
        self.service = service
        self.user = user
    }
    
    func fetch() {
        service.get(user: user, completion: { repo in
            self.output?.fetched(repo)
        })
    }
}
