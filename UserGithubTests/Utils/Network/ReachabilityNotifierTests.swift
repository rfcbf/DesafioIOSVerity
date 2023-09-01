//
//  ReachabilityNotifierTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
import Reachability
@testable import UserGithub

class ReachabilityNotifierTests: XCTestCase {
    
    var reachabilityNotifier: ReachabilityNotifier!
    
    override func setUp() {
        super.setUp()
        reachabilityNotifier = ReachabilityNotifier.instance
    }
    
    override func tearDown() {
        reachabilityNotifier = nil
        super.tearDown()
    }
    
    func testIsNetworkAvailable() {
        // Given
        let reachability = try? Reachability()
        reachabilityNotifier.reachability = reachability
        
        // When
        let isNetworkAvailable = reachabilityNotifier.isNetworkAvailable
        
        // Then
        XCTAssertEqual(isNetworkAvailable, true)
    }
    
    func testReachabilityChanged() {
        // Given
        let reachability = try? Reachability()
        let notification = Notification(name: Notification.Name.reachabilityChanged, object: reachability)
        
        // When
        reachabilityNotifier.reachabilityChanged(notification: notification)
        
        // Then
        XCTAssertEqual(reachabilityNotifier.reachabilityStatus, reachability?.connection)
    }
    
    func testStartMonitoring() {
        // Given
        let reachability = try? Reachability()
        reachabilityNotifier.reachability = reachability
        
        // When
        reachabilityNotifier.startMonitoring()
        
        // Then
        XCTAssertEqual(reachabilityNotifier.reachabilityStatus, reachability?.connection)
    }
}
