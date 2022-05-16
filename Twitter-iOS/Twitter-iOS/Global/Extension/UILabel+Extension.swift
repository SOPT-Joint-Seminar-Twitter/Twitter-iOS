//
//  UILabel+Extension.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/16.
//

import UIKit

extension UILabel {
    func addLabelSpacing(kernValue: Double = -0.6, lineSpacing: CGFloat = 4.0) {
        if let labelText = self.text, labelText.count > 0 {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            attributedText = NSAttributedString(string: labelText,
                                                attributes: [.kern: kernValue,
                                                             .paragraphStyle: paragraphStyle])
            lineBreakStrategy = .hangulWordPriority
        }
    }

    func applyColor(to targetString: String, with color: UIColor) {
        if let labelText = self.text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.foregroundColor,
                                       value: color,
                                       range: (labelText as NSString).range(of: targetString))
            attributedText = attributedString
        }
    }

    func applyFont(to targetString: String, with font: UIFont) {
        if let labelText = self.text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.font,
                                       value: font,
                                       range: (labelText as NSString).range(of: targetString))
            attributedText = attributedString
        }
    }
}
