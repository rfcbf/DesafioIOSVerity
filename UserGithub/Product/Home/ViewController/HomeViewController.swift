//
//  ViewController.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 29/08/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var tableView: UITableView!
    let searchController = UISearchController()
    var rowHeight: CGFloat = 125
    
    var presenter: HomePresenter?
    var filteredUser = [UsersModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpNavigation()
        self.setUpTableView()
        self.presenter?.viewDidLoad()
        self.initSearchController()
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

extension HomeViewController {
    
    private func setUpTableView() {
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0,
                                                   width: self.view.frame.width,
                                                   height: self.view.frame.height),
                                     style: UITableView.Style.plain)
        
        UserViewCell.registerCell(tableView: tableView)
        self.tableView.backgroundColor = UIColor.white
        self.tableView.assignTo(delegate: self, dataSource: self)
        self.view.addSubview(self.tableView)
    }
    
    private func setUpNavigation() {
        self.presenter?.navigationItem = self.navigationItem
        self.title = self.presenter?.title
        self.navigationItem.backButtonTitle = self.presenter?.backButtonTitle
    }
    
    private func initSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        searchController.searchBar.barStyle = .black
        
        let searchField = searchController.searchBar.value(forKey: "searchField") as? UITextField

        if let field = searchField {
            field.layer.cornerRadius = 10.0
            field.textColor = .white

            //sets indicator and cancel button Color
            field.tintColor = .white

            field.font = UIFont.systemFont(ofSize: 13)
            field.layer.masksToBounds = true


            //sets placeholder text Color
            let placeholderString = NSAttributedString(string: "Pesquisa por nome...",
                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            field.attributedPlaceholder = placeholderString

            //sets icon Color
            let iconView = field.leftView as! UIImageView
            iconView.image = iconView.image?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = .gray

            //sets textField backgroundColor
            if let backgroundview = field.subviews.first {
                backgroundview.backgroundColor = UIColor.white
            }
        }
        
        definesPresentationContext = true
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

extension HomeViewController: HomePresenterOutputProtocol {
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return self.filteredUser.count
        }
        return self.presenter?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserViewCell.cellIdentifier, for: indexPath) as! UserViewCell
        
        var user = UsersModel()
        if searchController.isActive {
            user = self.filteredUser[indexPath.row]
        } else {
            user = self.presenter?.getUser(at: indexPath.row) ?? UsersModel()
        }
        
        cell.setup(user: user)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive {
            let user = self.filteredUser[indexPath.row]
            self.presenter?.didSelectCellFiltred(user: user)
        } else {
            self.presenter?.didSelectCell(at: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}

extension HomeViewController: UISearchBarDelegate {
    
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        guard let searchText = searchBar.text else { return }
        
        filterUserForText(searchText : searchText)
    }
    
    func filterUserForText(searchText : String) {
        guard let user = self.presenter?.viewModel else { return }
        
        filteredUser = user.filter({ userFilted in
            if searchController.searchBar.text != "" {
                let searchTextMatch = userFilted.login?.lowercased().contains(searchText.lowercased())
                return searchTextMatch ?? false
            } else {
                return true
            }
        })
        
        self.tableView.reloadData()
    }
}
