//
//  TwittListWriter.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/06/02.
//

import Foundation


import Foundation

struct Writer: Codable {
    let id: String
    let userName : String
    let introduce : String
    let createdAt: String
    let updatedAt : String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userName
        case introduce
        case createdAt
        case updatedAt
    }
}
