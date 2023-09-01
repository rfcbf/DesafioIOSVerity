//
//  UIFont+Extension.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 29/08/23.
//

import UIKit

public extension UIFont {
    /// A scale value based on the current device text size setting. With the device using the
    /// default Large setting, `scaler` will be `1.0`. Only used when `UIFontMetrics` is not
    /// available.
    var scaler: CGFloat {
        let defaultBodySize = CGFloat(17.0)
        return UIFont.preferredFont(forTextStyle: .body).pointSize / defaultBodySize
    }

    /// Returns a version of the specified font that adopts the current font metrics.
    ///
    /// - Parameters:
    ///   - size: A font at its default point size.
    ///   - maximumPointSize: The maximum point size to scale up to.
    ///   - minimumPointSize: The minimum point size to scale down to.
    /// - Returns: The font at its constrained scaled point size.
    ///
    func preferredFont(maximumPointSize: CGFloat = .infinity,
                       minimumPointSize: CGFloat = .zero) -> UIFont? {
        if #available(iOS 11.0, *) {
            return UIFontMetrics.default.scaledFont(for: self,
                                                    maximumPointSize: maximumPointSize,
                                                    compatibleWith: nil)
        } else {
            let size = max(min(scaler * pointSize, maximumPointSize), minimumPointSize)
            let newFont = withSize(size)
            return newFont
        }
    }
}
