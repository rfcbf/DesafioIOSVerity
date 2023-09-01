//
//  HomeInteractor.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

protocol HomeInteractorInputProtocol {
    func fetch()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func fetched(users: [UsersModel]?)
}

class HomeInteractor: HomeInteractorInputProtocol {
    weak var output: HomeInteractorOutputProtocol?
    private var service: UsersServiceProtocol
    
    init(service: UsersServiceProtocol) {
        self.service = service
    }
    
    func fetch() {
        service.get(completion: { users in
            self.output?.fetched(users: users)
        })
    }
}
