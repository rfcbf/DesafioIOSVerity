//
//  DetailUserViewController.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit

class DetailUserViewController: UIViewController {
    
    var presenter: DetailUserPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpNavigation()
        self.presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.updateUI()
    }
}

extension DetailUserViewController {
    
    private func setUpView(_ user: DetailUserModel) {
        if let _ = self.presenter?.viewModel.login {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "code_fork", in: Bundle.main, compatibleWith: nil),
                                                                     style: .plain, target: self, action: #selector(addTapped))
        }

        let screenSize: CGRect = UIScreen.main.bounds
        let view = DetailUserView(frame: CGRect(x: 0,
                                                y: 0,
                                                width: screenSize.width,
                                                height: screenSize.height))
        view.backgroundColor = .white
        self.view.addSubview(view)
        view.setup(user: user)
    }
    
    private func setUpNavigation() {
        self.presenter?.navigationItem = self.navigationItem
        self.title = self.presenter?.title
        self.navigationItem.backButtonTitle = self.presenter?.backButtonTitle
    }
    
    @objc func addTapped() {
        self.presenter?.showRepo()
    }
}

extension DetailUserViewController: DetailUserPresenterOutputProtocol {
    func updateUI() {
        DispatchQueue.main.async {
            self.view.stopActivity()
            guard let user = self.presenter?.viewModel else {
                self.showViewError()
                return
            }
            self.setUpView(user)
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
                    self.updateUI()
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

                if let _ = self.presenter?.viewModel.login {
                    self.presentLoading()
                    self.setUpNavigation()
                    self.presenter?.viewDidLoad()
                    self.updateUI()
                } else {
                    self.showViewError()
                }
            }
            view.backgroundColor = .white
            self.view.addSubview(view)
        }
    }
}
