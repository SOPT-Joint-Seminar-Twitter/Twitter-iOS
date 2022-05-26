//
//  UIButton+Extension.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/16.
//

import UIKit

extension UIButton {
    
    var contentSize: CGFloat {
        return intrinsicContentSize.width
    }
    
    var margin: CGFloat {
        return (frame.width - contentSize) / 2
    }
}
