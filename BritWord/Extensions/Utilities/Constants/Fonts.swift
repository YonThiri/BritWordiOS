//
//  Fonts.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import SwiftUI

enum AppFont {

    static let header       = Font.custom(Poppins.extraBold.weight,    size: 40)
    static let header2      = Font.custom(Poppins.extraBold.weight,    size: 30)
    static let title        = Font.custom(Poppins.bold.weight,         size: 24)
    static let title2       = Font.custom(Poppins.extraBold.weight,    size: 22)
    static let subtitle     = Font.custom(Poppins.bold.rawValue,         size: 16)
    static let body         = Font.custom(Poppins.bold.weight,       size: 14)
    static let body2        = Font.custom(Poppins.medium.weight,      size: 14)
    static let footnote     = Font.custom(Poppins.regular.weight,      size: 13)
    static let footnote2    = Font.custom(Poppins.regular.weight,      size: 11)
    
    static var custom: (Poppins, CGFloat) -> Font = { (weight, size) in
        return Font.custom(weight.weight, size: size)
    }
}

enum Poppins: String {

    case black        = "Poppins-Black"
    case extraBold    = "Poppins-ExtraBold"
    case bold         = "Poppins-Bold"
    case semiBold     = "Poppins-SemiBold"
    case medium       = "Poppins-Medium"
    case regular      = "Poppins-Regular"
    case light        = "Poppins-Light"
    case extraLight   = "Poppins-ExtraLight"
    case thin         = "Poppins-Thin"
    
    var weight: String { return self.rawValue }
}
