//
//  User.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/06/01.
//

import Foundation

struct UserResponse : Codable {
    let id : String
    let userName : String
    let userId : String
    let introduce : String
    let createdAt : String
    let updatedAt : String
    
    enum CodingKeys : String, CodingKey {
        case id = "_id"
        case userName
        case userId
        case introduce
        case createdAt
        case updatedAt
    }
}
