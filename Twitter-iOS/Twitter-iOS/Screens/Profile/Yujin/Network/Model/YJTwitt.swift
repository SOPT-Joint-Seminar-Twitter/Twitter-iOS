//
//  Twitt.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/06/01.
//

import Foundation

struct TwittResponse : Codable {
    let isLike : Bool
    let isRetwit : Bool
    let twitId : String
    let content : String
    let likeCount : Int
    let writer : YJWriter
    
    enum CodingKeys : String, CodingKey {
        case twitId = "_id"
        case content
        case writer
        case likeCount
        case isLike
        case isRetwit
    }
}
