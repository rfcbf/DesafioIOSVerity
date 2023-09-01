//
//  RepoViewCell.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit

public class RepoViewCell: UITableViewCell {
    static let cellIdentifier = "RepoViewCell"

    var repoView: RepoView!
    var bottomSeparator: UIView!
    
    var controller: RepoViewCellController?
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        
        self.controller = RepoViewCellController(delegate: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.updateViews()
    }
    
    func setup(repo: RepoModel) {
        self.controller?.setup(repo: repo)
        self.initWidgets()
        self.addViews()
        self.updateViews()
        self.controller?.setData()
    }

    func initWidgets() {
        self.repoView = RepoView()
        
        self.bottomSeparator = UIView()
        self.bottomSeparator.backgroundColor = UIColor.barSeparator
    }
    
    private func addViews() {
        self.subviews.forEach({view in
            view.removeFromSuperview()
        })
        self.addSubview(repoView)
        self.addSubview(bottomSeparator)
    }
    
    private func updateViews() {
        self.repoView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: self.frame.size.width,
                                     height: self.frame.size.height)
        self.bottomSeparator.frame = CGRect(x: 10, y: self.frame.size.height - 1, width: self.frame.size.width - 10, height: 1)
    }

    public static func registerCell(tableView: UITableView) {
        tableView.register(RepoViewCell.self, forCellReuseIdentifier: RepoViewCell.cellIdentifier)
    }
}

extension RepoViewCell: RepoCellDelegate {
    func setRepos(repo: RepoModel) {
        self.repoView.setup(repo: repo)
    }
}
