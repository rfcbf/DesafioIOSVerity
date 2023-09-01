//
//  RepoViewCellController.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation

protocol RepoCellDelegate {
    func setRepos(repo: RepoModel)
}

public class RepoViewCellController {
    
    var delegate: RepoCellDelegate?
    var repo = RepoModel()
    
    init(delegate: RepoCellDelegate) {
        self.delegate = delegate
    }
    
    func setup(repo: RepoModel) {
        self.repo = repo
    }
    
    func setData() {
        self.delegate?.setRepos(repo: self.repo)
    }
}
