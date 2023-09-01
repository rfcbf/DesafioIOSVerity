//
//  UserView.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit
import Alamofire
import SDWebImage

public class UserView: UIView {
    var user: UsersModel?
    
    lazy var containerView: UIView = {
        let view = UIView()
        
        view.addSubview(avatar)
        avatar.anchor(top: view.topAnchor,
                      left: view.leftAnchor,
                      paddingTop: 16,
                      paddingLeft: 16,
                      width: 80,
                      height: 80)
        avatar.layer.cornerRadius = 40

        view.addSubview(loginLabel)
        loginLabel.anchor(top: view.topAnchor,
                          left: avatar.rightAnchor,
                          paddingTop: 20,
                          paddingLeft: 16)

        view.addSubview(typeLabel)
        typeLabel.anchor(top: loginLabel.bottomAnchor,
                         left: avatar.rightAnchor,
                         paddingTop: 16,
                         paddingLeft: 16)

        view.addSubview(admLabel)
        admLabel.anchor(top: typeLabel.bottomAnchor,
                        left: avatar.rightAnchor,
                        paddingTop: 4,
                        paddingLeft: 16)

        view.addSubview(arrow)
        arrow.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        arrow.anchor(right: view.rightAnchor,
                     paddingRight: 16,
                     width: 16,
                     height: 16)

        return view
    }()
    
    let avatar: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.black.cgColor
        iv.sd_imageIndicator = SDWebImageActivityIndicator.gray
        return iv
    }()
    
    var loginLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.titleLabel
        label.numberOfLines = 1
        return label
    }()

    let typeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    let admLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    let arrow: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.tintColor = .gray
        return iv
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
        self.initWidgets()
        self.updateViews()
    }
    
    func setup(user: UsersModel) {
        self.user = user
        self.setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initWidgets() {
        self.avatar.image = UIImage(named: "GitHub_Mark_Black", in: Bundle.main, compatibleWith: nil)
        self.arrow.image = UIImage(systemName: "chevron.right")
    }
    
    private func updateViews() {
        addSubview(containerView)
        containerView.anchor(top: topAnchor,
                             left: leftAnchor,
                             bottom: bottomAnchor,
                             right: rightAnchor)
    }
    
    private func setData() {
        guard let user = user else { return }
        guard let login = user.login else { return }
        guard let type = user.type else { return }
        guard let adm = user.siteAdmin else { return }

        self.loginLabel.text = "Login: \(String(describing: login))"
        self.typeLabel.text = "Tipo de usuario: \(String(describing: type))"
        self.admLabel.text = "Administrador: \(adm ? "Sim" : "Não")"
        
        self.avatar.sd_imageIndicator?.startAnimatingIndicator()
        if let strUrl = user.avatarURL?.absoluteString {
            self.avatar.sd_setImage(with: URL(string: strUrl),
                                    placeholderImage: UIImage(named: "GitHub_Mark_Black", in: Bundle.main, compatibleWith: nil))
        }
        self.avatar.sd_imageIndicator?.stopAnimatingIndicator()
    }
}
