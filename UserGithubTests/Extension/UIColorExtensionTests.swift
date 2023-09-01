//
//  UIColorExtensionTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
import UIKit
@testable import UserGithub

class UIColorExtensionTests: XCTestCase {
    
    func testGithubBlack() {
        let githubBlack = UIColor.githubBlack
        
        XCTAssertEqual(githubBlack.cgColor.components?[0], 0.09)
        XCTAssertEqual(githubBlack.cgColor.components?[1], 0.08)
        XCTAssertEqual(githubBlack.cgColor.components?[2], 0.09)
        XCTAssertEqual(githubBlack.cgColor.components?[3], 1.00)
    }
    
    func testTitleLabel() {
        let titleLabel = UIColor.titleLabel
        
        XCTAssertEqual(titleLabel.cgColor.components?[0], 0.01)
        XCTAssertEqual(titleLabel.cgColor.components?[1], 0.40)
        XCTAssertEqual(titleLabel.cgColor.components?[2], 0.84)
        XCTAssertEqual(titleLabel.cgColor.components?[3], 1.00)
    }
    
    func testOrangeFork() {
        let orangeFork = UIColor.orangeFork
        
        XCTAssertEqual(orangeFork.cgColor.components?[0], 1.00)
        XCTAssertEqual(orangeFork.cgColor.components?[1], 0.58)
        XCTAssertEqual(orangeFork.cgColor.components?[2], 0.00)
        XCTAssertEqual(orangeFork.cgColor.components?[3], 1.00)
    }
    
    func testSeparator() {
        let barSeparator = UIColor.barSeparator
        
        XCTAssertEqual(barSeparator.cgColor.components?[0], 0.94)
        XCTAssertEqual(barSeparator.cgColor.components?[1], 0.94)
        XCTAssertEqual(barSeparator.cgColor.components?[2], 0.94)
        XCTAssertEqual(barSeparator.cgColor.components?[3], 0.90)
    }
    
    func testDarkWhite() {
        let darkWhite = UIColor.darkWhite
        
        XCTAssertEqual(darkWhite.cgColor.components?[0], 0.96)
        XCTAssertEqual(darkWhite.cgColor.components?[1], 0.96)
        XCTAssertEqual(darkWhite.cgColor.components?[2], 0.96)
        XCTAssertEqual(darkWhite.cgColor.components?[3], 0.90)
    }
}
