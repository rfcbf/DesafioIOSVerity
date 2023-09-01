//
//  UIViewExtensionTests.swift
//  UserGithubTests
//
//  Created by Renato Ferraz Castelo on 01/09/23.
//

import XCTest
@testable import UserGithub

class UIViewExtensionTests: XCTestCase {
    
    var view: UIView!
    
    override func setUp() {
        super.setUp()
        view = UIView()
    }
    
    override func tearDown() {
        view = nil
        super.tearDown()
    }
    
    func testPresentActivity() {
        view.presentActivity()
        let activityIndicatorView = view.subviews.first as? UIActivityIndicatorView
        XCTAssertNotNil(activityIndicatorView)
        XCTAssertTrue(activityIndicatorView?.isAnimating ?? false)
    }
    
    func testStopActivity() {
        let activityIndicatorView = UIActivityIndicatorView()
        view.addSubview(activityIndicatorView)
        
        view.stopActivity()
        XCTAssertTrue(view.subviews.isEmpty)
    }
    
    func testPosition() {
        let position = CGPoint(x: 10, y: 20)
        view.position(position)
        XCTAssertEqual(view.frame.origin, position)
    }
    
    func testSize() {
        let size = CGSize(width: 100, height: 200)
        view.size(size)
        XCTAssertEqual(view.frame.size, size)
    }
    
    func testCornerRadius() {
        let radius: CGFloat = 10
        view.cornerRadius(radius: radius)
        XCTAssertTrue(view.clipsToBounds)
        XCTAssertEqual(view.layer.cornerRadius, radius)
    }
    
    func testSetBorder() {
        let width: CGFloat = 2
        let color = UIColor.red
        view.setBorder(width: width, color: color)
        XCTAssertEqual(view.layer.borderWidth, width)
        XCTAssertEqual(view.layer.borderColor, color.cgColor)
    }
    
    func testCircle() {
        let width: CGFloat = 100
        let height: CGFloat = 100
        view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        view.circle()
        XCTAssertTrue(view.clipsToBounds)
        XCTAssertEqual(view.layer.cornerRadius, width/2)
    }
    
    func testIsVisible() {
        let window = UIWindow()
        let rootViewController = UIViewController()
        let rootView = UIView()
        rootView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        rootViewController.view = rootView
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        let view = UIView()
        rootView.addSubview(view)
        
        view.isHidden = true
        XCTAssertFalse(view.isVisible(view))
        
        view.isHidden = false
        view.removeFromSuperview()
        XCTAssertFalse(view.isVisible(view))
        
        view.isHidden = false
        rootView.removeFromSuperview()
        XCTAssertFalse(view.isVisible(view))
    }
    
    func testAnchor() {
        let topAnchor = view.topAnchor
        let leftAnchor = view.leftAnchor
        let bottomAnchor = view.bottomAnchor
        let rightAnchor = view.rightAnchor
        let paddingTop: CGFloat = 10
        let paddingLeft: CGFloat = 20
        let paddingBottom: CGFloat = 30
        let paddingRight: CGFloat = 40
        let width: CGFloat = 100
        let height: CGFloat = 200
        
        view.anchor(top: topAnchor,
                    left: leftAnchor,
                    bottom: bottomAnchor,
                    right: rightAnchor,
                    paddingTop: paddingTop,
                    paddingLeft: paddingLeft,
                    paddingBottom: paddingBottom,
                    paddingRight: paddingRight,
                    width: width,
                    height: height)
        
        XCTAssertEqual(view.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(view.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop).isActive, false)
        XCTAssertEqual(view.leftAnchor.constraint(equalTo: leftAnchor, constant: paddingLeft).isActive, false)
        XCTAssertEqual(view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -paddingBottom).isActive, false)
        XCTAssertEqual(view.rightAnchor.constraint(equalTo: rightAnchor, constant: -paddingRight).isActive, false)
        XCTAssertEqual(view.widthAnchor.constraint(equalToConstant: width).isActive, false)
        XCTAssertEqual(view.heightAnchor.constraint(equalToConstant: height).isActive, false)
    }
    
}
