//
//  UINavigatorController+Extension.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import UIKit

extension UINavigationController {
    
    func setupNavBarColor() {
        
        let appearence = UINavigationBarAppearance()
        appearence.configureWithOpaqueBackground()
        
        appearence.backgroundColor = .black
        appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearence.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationBar.standardAppearance = appearence
        self.navigationBar.scrollEdgeAppearance = appearence
        self.navigationBar.compactAppearance = appearence
        
        self.navigationBar.tintColor = .white
        UIBarButtonItem.appearance().tintColor = .white
    }
}
