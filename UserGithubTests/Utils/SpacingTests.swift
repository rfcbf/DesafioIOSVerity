//
//  SpacingTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class SpacingTests: XCTestCase {
    
    func testLargeSpacing() {
        let largeSpacing = Spacing.large
        XCTAssertEqual(largeSpacing.value, CGFloat(32.00))
        XCTAssertEqual(largeSpacing.name, "large")
    }
    
    func testMediumSpacing() {
        let mediumSpacing = Spacing.medium
        XCTAssertEqual(mediumSpacing.value, CGFloat(24.00))
        XCTAssertEqual(mediumSpacing.name, "medium")
    }
    
    func testSmallSpacing() {
        let smallSpacing = Spacing.small
        XCTAssertEqual(smallSpacing.value, CGFloat(16.00))
        XCTAssertEqual(smallSpacing.name, "small")
    }
    
    func testXLargeSpacing() {
        let xLargeSpacing = Spacing.xLarge
        XCTAssertEqual(xLargeSpacing.value, CGFloat(40.00))
        XCTAssertEqual(xLargeSpacing.name, "xLarge")
    }
    
    func testXSmallSpacing() {
        let xSmallSpacing = Spacing.xSmall
        XCTAssertEqual(xSmallSpacing.value, CGFloat(12.00))
        XCTAssertEqual(xSmallSpacing.name, "xSmall")
    }
    
    func testXXLargeSpacing() {
        let xxLargeSpacing = Spacing.xxLarge
        XCTAssertEqual(xxLargeSpacing.value, CGFloat(48.00))
        XCTAssertEqual(xxLargeSpacing.name, "xxLarge")
    }
    
    func testXXSmallSpacing() {
        let xxSmallSpacing = Spacing.xxSmall
        XCTAssertEqual(xxSmallSpacing.value, CGFloat(8.00))
        XCTAssertEqual(xxSmallSpacing.name, "xxSmall")
    }
    
    func testXXXLargeSpacing() {
        let xxxLargeSpacing = Spacing.xxxLarge
        XCTAssertEqual(xxxLargeSpacing.value, CGFloat(64.00))
        XCTAssertEqual(xxxLargeSpacing.name, "xxxLarge")
    }
    
    func testXXXSmallSpacing() {
        let xxxSmallSpacing = Spacing.xxxSmall
        XCTAssertEqual(xxxSmallSpacing.value, CGFloat(4.00))
        XCTAssertEqual(xxxSmallSpacing.name, "xxxSmall")
    }
    
    func testZeroSpacing() {
        let zeroSpacing = Spacing.zero
        XCTAssertEqual(zeroSpacing.value, CGFloat(0.00))
        XCTAssertEqual(zeroSpacing.name, "zero")
    }
    
    func testAllCases() {
        XCTAssertEqual(Spacing.allCases.count, 10)
        XCTAssertTrue(Spacing.allCases.contains(Spacing.large))
        XCTAssertTrue(Spacing.allCases.contains(Spacing.medium))
        XCTAssertTrue(Spacing.allCases.contains(Spacing.small))
        XCTAssertTrue(Spacing.allCases.contains(Spacing.xLarge))
        XCTAssertTrue(Spacing.allCases.contains(Spacing.xSmall))
        XCTAssertTrue(Spacing.allCases.contains(Spacing.xxLarge))
        XCTAssertTrue(Spacing.allCases.contains(Spacing.xxSmall))
        XCTAssertTrue(Spacing.allCases.contains(Spacing.xxxLarge))
        XCTAssertTrue(Spacing.allCases.contains(Spacing.xxxSmall))
        XCTAssertTrue(Spacing.allCases.contains(Spacing.zero))
    }
    
    static var allTests = [
        ("testLargeSpacing", testLargeSpacing),
        ("testMediumSpacing", testMediumSpacing),
        ("testSmallSpacing", testSmallSpacing),
        ("testXLargeSpacing", testXLargeSpacing),
        ("testXSmallSpacing", testXSmallSpacing),
        ("testXXLargeSpacing", testXXLargeSpacing),
        ("testXXSmallSpacing", testXXSmallSpacing),
        ("testXXXLargeSpacing", testXXXLargeSpacing),
        ("testXXXSmallSpacing", testXXXSmallSpacing),
        ("testZeroSpacing", testZeroSpacing),
        ("testAllCases", testAllCases)
    ]
}
