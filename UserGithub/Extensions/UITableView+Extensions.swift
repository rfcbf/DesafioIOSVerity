//
//  UITableView+Extensions.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit

extension UITableView {
    
    func assignTo(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    func updateSize(size: CGSize) {
        self.frame.size = size
    }
    
    func setSeparator(style: UITableViewCell.SeparatorStyle = .singleLine, color: UIColor = UIColor.lightGray) {
        self.separatorStyle = style
        self.separatorColor = color
        self.clipsToBounds = true
    }
}
