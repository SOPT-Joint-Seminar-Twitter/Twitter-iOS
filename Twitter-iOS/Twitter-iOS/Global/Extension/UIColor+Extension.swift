//
//  UIColor+Extension.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/16.
//

import UIKit

extension UIColor {
    static var twitter_white: UIColor {
        return UIColor(hex: "#ffffff")
    }

    static var twitter_green: UIColor {
        return UIColor(hex: "#53b781")
    }

    static var twitter_blue1: UIColor {
        return UIColor(hex: "#4a98e9")
    }

    static var twitter_blue2: UIColor {
        return UIColor(hex: "#244d76")
    }

    static var twitter_blue3: UIColor {
        return UIColor(hex: "#244d76")
    }

    static var twitter_blue4: UIColor {
        return UIColor(hex: "#87a1b7")
    }

    static var twitter_gray10: UIColor {
        return UIColor(hex: "#d9d9d9")
    }

    static var twitter_gray50: UIColor {
        return UIColor(hex: "#72767a")
    }

    static var twitter_gray100: UIColor {
        return UIColor(hex: "#333638")
    }

    static var twitter_black: UIColor {
        return UIColor(hex: "#000000")
    }

    static var twitter_black_opacity_8: UIColor {
        return UIColor(white: 0.0, alpha: 0.08)
    }

    static var twitter_black_opacity_50: UIColor {
        return UIColor(white: 0.0, alpha: 0.5)
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
