//
//  Writer.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/28.
//

import Foundation

struct Writer: Codable {
    let id: String
    let userName: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userName
    }
}
