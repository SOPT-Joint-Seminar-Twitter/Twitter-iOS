//
//  UIFont+Extension.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/16.
//

import UIKit

enum FontName: String {
    case robotoBlack = "Roboto-Black"
    case robotoBold = "Roboto-Bold"
    case robotoLight = "Roboto-Light"
    case robotoMedium = "Roboto-Medium"
    case robotoRegular = "Roboto-Regular"
    case helveticaBold = "Helvetica Bold"
    case helveticaLight = "Helvetica Light"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
