//
//  AppDelegate.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 29/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = self.window else { return false }
        HomeRouter().present(in: window)
        return true
    }
}

