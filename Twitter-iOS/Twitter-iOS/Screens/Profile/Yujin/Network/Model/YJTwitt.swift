//
//  Twitt.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/06/01.
//

import Foundation

struct TwittResponse : Codable {
    let twitId : String
    let content : String
    let writer : YJWriter
    let likeCount : Int
    let isLike : Bool
    let isRetwit : Bool
    
    enum CodingKeys : String, CodingKey {
        case twitId = "_id"
        case content
        case writer
        case likeCount
        case isLike
        case isRetwit
    }
}
