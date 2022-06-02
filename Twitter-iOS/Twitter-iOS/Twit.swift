//
//  Twit.swift
//  Twitter-iOS
//
//  Created by 김민재 on 2022/05/31.
//

import Foundation

struct Twit: Codable {
    let id: String
    let content: String
    let writer: Writer
    let likeCount: Int
    let isLike: Bool
    let isRetwit: Bool
}
