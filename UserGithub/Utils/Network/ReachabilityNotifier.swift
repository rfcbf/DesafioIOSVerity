//
//  ReachabilityNotifier.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation
import UIKit
import Reachability

protocol ReachabilityNotifierDelegate {
    func callReachabilityScreen(status: Reachability.Connection)
}

class ReachabilityNotifier {
    static let instance = ReachabilityNotifier()
    
    var delegate: ReachabilityNotifierDelegate?
    
    var isNetworkAvailable : Bool {
        self.reachability = try? Reachability()

        if let reachability = self.reachability {
            return reachability.connection != .unavailable
        }
        return true
    }
    
    var reachabilityStatus: Reachability.Connection = .unavailable
    
    var reachability: Reachability?
    
    private init() {
        self.reachability = try? Reachability()
    }
    
    @objc func reachabilityChanged(notification: Notification) {
        let reachability = notification.object as! Reachability
        
        switch reachability.connection {
        case .unavailable:
            Logs.d("Rede não conectada!")
        case .wifi:
            Logs.d("Rede WiFi conectada!")
        case .cellular:
            Logs.d("Rede dados do Celular conectada!")
        case .none:
            Logs.d("Rede não conectada!")
        }
        
        self.reachabilityStatus = reachability.connection
    }

    func startMonitoring() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: Notification.Name.reachabilityChanged,
                                               object: reachability)
        guard let reachability = reachability else {
            Logs.w("Reachability não iniciado!")
            return
        }
        
        do{
            try reachability.startNotifier()
            self.reachabilityStatus = reachability.connection
        } catch {
            Logs.d("Não foi possível iniciar o NOTIFIER do Reachability!")
        }
    }
}

