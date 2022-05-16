//
//  NSObject+Extension.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/16.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
