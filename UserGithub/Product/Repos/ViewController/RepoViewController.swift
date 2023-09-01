//
//  RepoViewController.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//


import UIKit

class RepoViewController: UIViewController {
    
    var tableView: UITableView!
    var rowHeight: CGFloat = 150
    
    var presenter: RepoPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpNavigation()
        self.setUpTableView()
        self.presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
        self.tableView.reloadData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if self.tableView != nil {
            self.tableView.updateSize(size: size)
            self.tableView.reloadData()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension RepoViewController {
    
    private func setUpTableView() {
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0,
                                                   width: self.view.frame.width,
                                                   height: self.view.frame.height),
                                     style: UITableView.Style.plain)
        
        RepoViewCell.registerCell(tableView: tableView)
        self.tableView.backgroundColor = UIColor.white
        self.tableView.assignTo(delegate: self, dataSource: self)
        self.view.addSubview(self.tableView)
    }
    
    private func setUpNavigation() {
        self.presenter?.navigationItem = self.navigationItem
        
        if let title = self.presenter?.title, let user = self.presenter?.user {
            self.title = "\(title) - \(user)"
        } else {
            self.title = self.presenter?.title
        }
    }
}

extension RepoViewController: RepoPresenterOutputProtocol {
    func updateUIList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.view.stopActivity()
        }
    }

    func presentLoading() {
        self.view.presentActivity()
    }
    
    func stopLoading() {
        DispatchQueue.main.async {
            self.view.stopActivity()
        }
    }
    
    func showViewOutInternet() {
        self.stopLoading()

        DispatchQueue.main.async {
            let screenSize: CGRect = UIScreen.main.bounds
            let view = InternetOutView(frame: CGRect(x: 0,
                                                     y: 0,
                                                     width: screenSize.width,
                                                     height: screenSize.height)) {
                
                if ReachabilityNotifier.instance.isNetworkAvailable {
                    self.presentLoading()
                    self.presenter?.viewDidLoad()
                    self.setUpTableView()
                    self.updateUIList()
                } else {
                    self.showViewOutInternet()
                }
            }
            view.backgroundColor = .white
            self.view.addSubview(view)
        }
    }
    
    func showViewError() {
        self.stopLoading()

        DispatchQueue.main.async {
            let screenSize: CGRect = UIScreen.main.bounds
            let view = ErrorView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: screenSize.width,
                                               height: screenSize.height)) {
                
                self.presentLoading()
                self.presenter?.viewDidLoad()
                self.setUpTableView()
                self.updateUIList()
            }
            view.backgroundColor = .white
            self.view.addSubview(view)
        }
    }
}

extension RepoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoViewCell.cellIdentifier, for: indexPath) as! RepoViewCell
        
        let repo = self.presenter?.getRepo(at: indexPath.row) ?? RepoModel()
        cell.setup(repo: repo)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}
