//
//  RepoView.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit
import Alamofire

public class RepoView: UIView {
    var repo: RepoModel?
    
    lazy var containerView: UIView = {
        let view = UIView()
        
        view.addSubview(repoNameLabel)
        repoNameLabel.anchor(top: view.topAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,
                          paddingTop: 8,
                          paddingLeft: 20,
                          paddingRight: 8)

        view.addSubview(nameLabel)
        nameLabel.anchor(top: repoNameLabel.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 8,
                         paddingLeft: 20,
                         paddingRight: 8)

        view.addSubview(linkLabel)
        linkLabel.anchor(top: nameLabel.bottomAnchor,
                        left: view.leftAnchor,
                        right: view.rightAnchor,
                        paddingTop: 4,
                        paddingLeft: 20,
                        paddingRight: 8)

        view.addSubview(createdAtLabel)
        createdAtLabel.anchor(top: linkLabel.bottomAnchor,
                              left: view.leftAnchor,
                              right: view.rightAnchor,
                              paddingTop: 16,
                              paddingLeft: 20,
                              paddingRight: 8)

        view.addSubview(visibilityLabel)
        visibilityLabel.anchor(top: createdAtLabel.bottomAnchor,
                               left: view.leftAnchor,
                               right: view.rightAnchor,
                               paddingTop: 4,
                               paddingLeft: 20,
                               paddingRight: 8)

        
        return view
    }()

    let repoNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor.titleLabel
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .systemGray2
        return label
    }()
    
    let linkLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .systemGray2
        return label
    }()
    
    let createdAtLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    let visibilityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.callInits()
    }
    
    init() {
        super.init(frame: CGRect())
        self.callInits()
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.updateViews()
    }
    
    private func callInits() {
        self.updateViews()
    }
    
    func setup(repo: RepoModel) {
        self.repo = repo
        self.setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func updateViews() {
        addSubview(containerView)
        containerView.anchor(top: topAnchor,
                             left: leftAnchor,
                             bottom: bottomAnchor,
                             right: rightAnchor)
    }
    
    private func setData() {
        guard let repo = repo else { return }
        guard let repoName = repo.name else { return }
        guard let fullName = repo.fullName else { return }
        guard let site = repo.htmlURL else { return }
        guard let visibility = repo.visibility else { return }
        guard let createdAt = repo.createdAt else { return }

        self.repoNameLabel.text = "\(repoName)"
        self.nameLabel.text = "\(fullName)"
        self.linkLabel.text = "\(site)"
        self.createdAtLabel.text = "Criado em: \(createdAt)"
        self.visibilityLabel.text = "Visível para: \(visibility)"
    }
}
