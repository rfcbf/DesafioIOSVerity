//
//  UIView+Extension.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 30/08/23.
//

import Foundation
import UIKit

extension UIView {
    
    func presentActivity() {
        let activity = UIActivityIndicatorView(frame: self.frame)
        activity.backgroundColor = UIColor.white
        activity.color = UIColor.black
        activity.startAnimating()
        
        addSubview(activity)
    }
    
    func stopActivity() {
        subviews.forEach({ view in
            if view is UIActivityIndicatorView {
                view.removeFromSuperview()
            }
        })
    }
    
    func position(_ position: CGPoint) {
        self.frame.origin = position
    }
    
    func size(_ size: CGSize) {
        self.frame.size = size
    }
    
    func cornerRadius(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func setBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func circle() {
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
    
    func isVisible(_ view: UIView) -> Bool {
        if view.isHidden || view.superview == nil {
            return false
        }

        if let window = UIApplication.shared.windows.first, let rootViewController = window.rootViewController,
            let rootView = rootViewController.view {

            let viewFrame = view.convert(view.bounds, to: rootView)

            let topSafeArea: CGFloat
            let bottomSafeArea: CGFloat

            if #available(iOS 11.0, *) {
                topSafeArea = rootView.safeAreaInsets.top
                bottomSafeArea = rootView.safeAreaInsets.bottom
            } else {
                topSafeArea = rootViewController.topLayoutGuide.length
                bottomSafeArea = rootViewController.bottomLayoutGuide.length
            }

            return viewFrame.minX >= 0 &&
                   viewFrame.maxX <= rootView.bounds.width &&
                   viewFrame.minY >= topSafeArea &&
                   viewFrame.maxY <= rootView.bounds.height - bottomSafeArea
        }

        return false
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat? = 0,
                paddingLeft: CGFloat? = 0,
                paddingBottom: CGFloat? = 0,
                paddingRight: CGFloat? = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
           
           translatesAutoresizingMaskIntoConstraints = false
           
           if let top = top {
               topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
           }
           
           if let left = left {
               leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
           }
           
           if let bottom = bottom {
               if let paddingBottom = paddingBottom {
                   bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
               }
           }
           
           if let right = right {
               if let paddingRight = paddingRight {
                   rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
               }
           }
           
           if let width = width {
               widthAnchor.constraint(equalToConstant: width).isActive = true
           }
           
           if let height = height {
               heightAnchor.constraint(equalToConstant: height).isActive = true
           }
       }

}
