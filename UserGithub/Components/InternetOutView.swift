//
//  InternetOutView.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 31/08/23.
//

import UIKit

public class InternetOutView: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView()
        
        view.addSubview(image)
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        image.anchor(width: 100,
                     height: 100)

        view.addSubview(title)
        title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        title.anchor(top: image.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 16, paddingRight: 16)

        view.addSubview(subTitle)
        subTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        subTitle.anchor(top: title.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)

        view.addSubview(buttonRetry)
        buttonRetry.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonRetry.anchor(top: subTitle.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16, height: 44)

        return view
    }()
    
    let image: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderColor = UIColor.black.cgColor
        return iv
    }()

    var title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.text = "Ops, estamos sem internet"
        return label
    }()

    var subTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.gray
        label.numberOfLines = 2
        label.text = "No momento não posso continuar, que tal tentar mais tarde!!!!"
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
    
    let buttonRetry: UIButton = {
        let button = UIButton()
        button.setTitle("Tentar novamente", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.cornerRadius(radius: 16)
        return button
    }()
    
    private let action: (() -> Void)
    
    public init(frame: CGRect, tapAction: @escaping(() -> Void)) {
        self.action = tapAction
        super.init(frame: frame)
        self.callInits()
    }
    
    init(tapAction: @escaping(() -> Void)) {
        self.action = tapAction
        super.init(frame: CGRect())
        self.callInits()
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.updateViews()
    }
    
    private func callInits() {
        buttonRetry.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        self.initWidgets()
        self.updateViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initWidgets() {
        self.image.image = UIImage(named: "GitHub_Mark_Black", in: Bundle.main, compatibleWith: nil)
    }
    
    private func updateViews() {
        addSubview(containerView)
        containerView.anchor(top: topAnchor,
                             left: leftAnchor,
                             bottom: bottomAnchor,
                             right: rightAnchor)
    }
    
    @objc func addTapped() {

        DispatchQueue.main.async() {
            for view in self.subviews {
                view.removeFromSuperview()
            }
        }

        self.action()
    }
    
}
