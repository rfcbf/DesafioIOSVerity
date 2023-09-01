//
//  UserViewCellController.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

protocol UserCellDelegate {
    func setUser(user: UsersModel)
}

public class UserViewCellController {
    
    var delegate: UserCellDelegate?
    var user = UsersModel()
    
    init(delegate: UserCellDelegate) {
        self.delegate = delegate
    }
    
    func setup(user: UsersModel) {
        self.user = user
    }
    
    func setData() {
        self.delegate?.setUser(user: self.user)
    }
}
