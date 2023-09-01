//
//  UserViewCell.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit

public class UserViewCell: UITableViewCell {
    static let cellIdentifier = "UserViewCell"

    var userView: UserView!
    var bottomSeparator: UIView!
    
    var controller: UserViewCellController?
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        
        self.controller = UserViewCellController(delegate: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.updateViews()
    }
    
    func setup(user: UsersModel) {
        self.controller?.setup(user: user)
        self.initWidgets()
        self.addViews()
        self.updateViews()
        self.controller?.setData()
    }

    private func initWidgets() {
        self.userView = UserView() 
        
        self.bottomSeparator = UIView()
        self.bottomSeparator.backgroundColor = UIColor.separator
    }
    
    private func addViews() {
        self.subviews.forEach({view in
            view.removeFromSuperview()
        })
        self.addSubview(userView)
        self.addSubview(bottomSeparator)
    }
    
    private func updateViews() {
        self.userView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: self.frame.size.width,
                                     height: self.frame.size.height)
        self.bottomSeparator.frame = CGRect(x: 10, y: self.frame.size.height - 1, width: self.frame.size.width - 10, height: 1)
    }

    public static func registerCell(tableView: UITableView) {
        tableView.register(UserViewCell.self, forCellReuseIdentifier: UserViewCell.cellIdentifier)
    }
}

extension UserViewCell: UserCellDelegate {
    func setUser(user: UsersModel) {
        self.userView.setup(user: user)
    }
}

