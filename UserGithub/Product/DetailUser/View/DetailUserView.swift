//
//  DetailUserView.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit

public class DetailUserView: UIView {
    
    lazy var containerProfileView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        view.addSubview(avatar)
        avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        avatar.anchor(top: view.topAnchor,
                      paddingTop: 100,
                      width: 120,
                      height: 120)
        avatar.layer.cornerRadius = 120 / 2
        
        view.addSubview(loginLabel)
        loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginLabel.anchor(top: avatar.bottomAnchor,
                          paddingTop: 12)
        
        view.addSubview(nameLabel)
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.anchor(top: loginLabel.bottomAnchor,
                         paddingTop: 4)
        
        return view
    }()
    
    lazy var containerInfoView: UIView = {
        let view = UIView()
        
        view.addSubview(infoStackView)
        infoStackView.anchor(top: view.topAnchor,
                             left: view.leftAnchor,
                             bottom: view.bottomAnchor,
                             right: view.rightAnchor,
                             paddingLeft: 16,
                             paddingRight: 16)
        
        return view
    }()
    
    lazy var containerMoreView: UIView = {
        let view = UIView()
        
        view.addSubview(compantLabel)
        compantLabel.anchor(top: view.topAnchor,
                            left: view.leftAnchor,
                            right: view.rightAnchor,
                            paddingLeft: 16,
                            paddingRight: 16)
        
        view.addSubview(blogLabel)
        blogLabel.anchor(top: compantLabel.bottomAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingTop: 16,
                         paddingLeft: 16,
                         paddingRight: 16)
        
        view.addSubview(locationLabel)
        locationLabel.anchor(top: blogLabel.bottomAnchor,
                             left: view.leftAnchor,
                             right: view.rightAnchor,
                             paddingTop: 16,
                             paddingLeft: 16,
                             paddingRight: 16)
        
        view.addSubview(twitterLabel)
        twitterLabel.anchor(top: locationLabel.bottomAnchor,
                            left: view.leftAnchor,
                            right: view.rightAnchor,
                            paddingTop: 16,
                            paddingLeft: 16,
                            paddingRight: 16)
        
        view.addSubview(createLabel)
        createLabel.anchor(top: twitterLabel.bottomAnchor,
                           left: view.leftAnchor,
                           right: view.rightAnchor,
                           paddingTop: 16,
                           paddingLeft: 16,
                           paddingRight: 16)
        
        view.addSubview(updateLabel)
        updateLabel.anchor(top: createLabel.bottomAnchor,
                           left: view.leftAnchor,
                           bottom: view.bottomAnchor,
                           right: view.rightAnchor,
                           paddingTop: 16,
                           paddingLeft: 16,
                           paddingRight: 16)
        
        return view
    }()
    
    lazy var infoStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 16
        view.distribution = .fillEqually
        view.alignment = .center
        
        let card1 = UIView()
        card1.backgroundColor = .lightGray
        card1.cornerRadius(radius: 16)
        
        let card2 = UIView()
        card2.backgroundColor = .lightGray
        card2.cornerRadius(radius: 16)
        
        let card3 = UIView()
        card3.backgroundColor = .lightGray
        card3.cornerRadius(radius: 16)
        
        view.addArrangedSubview(card1)
        card1.anchor(height: 100)
        
        card1.addSubview(publicReposLabel)
        publicReposLabel.centerXAnchor.constraint(equalTo: card1.centerXAnchor).isActive = true
        publicReposLabel.anchor(top: card1.topAnchor,
                                left: card1.leftAnchor,
                                bottom: card1.bottomAnchor,
                                right: card1.rightAnchor)
        
        view.addArrangedSubview(card2)
        card2.anchor(height: 100)
        
        card2.addSubview(publicGistsLabel)
        publicGistsLabel.centerXAnchor.constraint(equalTo: card2.centerXAnchor).isActive = true
        publicGistsLabel.anchor(top: card2.topAnchor,
                                left: card2.leftAnchor,
                                bottom: card2.bottomAnchor,
                                right: card2.rightAnchor)
        
        view.addArrangedSubview(card3)
        card3.anchor(height: 100)
        
        card3.addSubview(followersLabel)
        followersLabel.centerXAnchor.constraint(equalTo: card3.centerXAnchor).isActive = true
        followersLabel.anchor(top: card3.topAnchor,
                              left: card3.leftAnchor,
                              bottom: card3.bottomAnchor,
                              right: card3.rightAnchor)
        
        return view
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        let screenSize: CGRect = UIScreen.main.bounds
        view.contentSize = CGSize(width: screenSize.width, height: screenSize.height)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let avatar: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        return iv
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .white
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    let publicReposLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let publicGistsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let followersLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let compantLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let blogLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    let twitterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    let createLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    let updateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    //MARK: lifecicly
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        DispatchQueue.main.async() {
            for view in self.subviews {
                view.removeFromSuperview()
            }
            
            self.addViews()
        }
    }
    
    func setup(user: DetailUserModel) {
        self.addViews()
        self.setData(user)
    }
    
    private func addViews() {
        backgroundColor = .white
        addSubview(scrollView)
        
        scrollView.addSubview(containerProfileView)
        containerProfileView.anchor(top: scrollView.topAnchor,
                                    left: leftAnchor,
                                    right: rightAnchor,
                                    height: 300)
        
        scrollView.addSubview(containerInfoView)
        containerInfoView.anchor(top: containerProfileView.bottomAnchor,
                                 left: leftAnchor,
                                 right: rightAnchor,
                                 paddingTop: 8)
        
        scrollView.addSubview(containerMoreView)
        containerMoreView.anchor(top: containerInfoView.bottomAnchor,
                                 left: leftAnchor,
                                 bottom: scrollView.bottomAnchor,
                                 right: rightAnchor,
                                 paddingTop: 16)
        
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setData(_ user: DetailUserModel) {
        if let strUrl = user.avatarURL?.absoluteString {
            self.avatar.sd_setImage(with: URL(string: strUrl),
                                    placeholderImage: UIImage(named: "GitHub_Mark_White", in: Bundle.main, compatibleWith: nil))
        }
        
        self.loginLabel.text = user.login
        self.nameLabel.text = user.name ?? "Não cadastrou o nome"
        self.publicReposLabel.text = "publicRepos\n\n \(user.publicRepos ?? 0)"
        self.publicGistsLabel.text = "public_gists\n\n \(user.publicGists ?? 0)"
        self.followersLabel.text = "followers\n\n \(user.followers ?? 0)"
        self.compantLabel.text = "Company: \(user.company ?? "Não adicionou companias")"
        self.blogLabel.text = "Blog: \(user.blog ?? "Não adicionou blog")"
        self.locationLabel.text = "Localização: \(user.location ?? "Não adicionou localização")"
        
        self.twitterLabel.text = "Twitter: \(user.twitterUsername ?? "Não adicionou Twitter")"
        self.createLabel.text = "Criado em: \(user.createdAt ?? "")"
        self.updateLabel.text = "Atualizado em: \(user.updatedAt ?? "Não sofreu atualização")"
    }
}
