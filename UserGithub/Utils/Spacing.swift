//
//  Spacing.swift
//  UserGithub
//
//  Created by Renato Ferraz Castelo on 29/08/23.
//

import UIKit

public struct Spacing: Equatable {
    public let value: CGFloat
    public let name: String
    
    /// large = CGFloat(32.00)
    public static let large = Spacing(value: CGFloat(32.00), name: "large")

    /// medium = CGFloat(24.00)
    public static let medium = Spacing(value: CGFloat(24.00), name: "medium")

    /// small = CGFloat(16.00)
    public static let small = Spacing(value: CGFloat(16.00), name: "small")

    /// xLarge = CGFloat(40.00)
    public static let xLarge = Spacing(value: CGFloat(40.00), name: "xLarge")

    /// xSmall = CGFloat(12.00)
    public static let xSmall = Spacing(value: CGFloat(12.00), name: "xSmall")

    /// xxLarge = CGFloat(48.00)
    public static let xxLarge = Spacing(value: CGFloat(48.00), name: "xxLarge")

    /// xxSmall = CGFloat(8.00)
    public static let xxSmall = Spacing(value: CGFloat(8.00), name: "xxSmall")

    /// xxxLarge = CGFloat(64.00)
    public static let xxxLarge = Spacing(value: CGFloat(64.00), name: "xxxLarge")

    /// xxxSmall = CGFloat(4.00)
    public static let xxxSmall = Spacing(value: CGFloat(4.00), name: "xxxSmall")

    /// zero = CGFloat(0.00)
    public static let zero = Spacing(value: CGFloat(0.00), name: "zero")


    public static let allCases: [Spacing] = [
        .large,
        .medium,
        .small,
        .xLarge,
        .xSmall,
        .xxLarge,
        .xxSmall,
        .xxxLarge,
        .xxxSmall,
        .zero,
    ]

    public static func == (lhs: Spacing, rhs: Spacing) -> Bool {
        return lhs.value == rhs.value && lhs.name.elementsEqual(rhs.name)
    }
}
