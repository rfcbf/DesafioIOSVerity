//
//  DetailUserInteractor.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

protocol DetailUserInteractorInputProtocol {
    var user: String { get }
    
    func fetch()
}

protocol DetailUserInteractorOutputProtocol: AnyObject {
    func fetched(_ user: DetailUserModel?)
}

class DetailUserInteractor: DetailUserInteractorInputProtocol {

    weak var output: DetailUserInteractorOutputProtocol?
    private var service: DeatilUsersServiceProtocol
    let user: String
    
    init(service: DeatilUsersServiceProtocol, user: String) {
        self.service = service
        self.user = user
    }
    
    func fetch() {
        service.get(user: user, completion: { user in
            self.output?.fetched(user)
        })
    }
}
