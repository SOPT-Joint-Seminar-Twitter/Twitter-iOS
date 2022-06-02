//
//  TwitPostRouter.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/28.
//

import Foundation
import UIKit

import Alamofire

enum TwitPostRouter {
    case postTwit(content: String, writer: Writer)
}

extension TwitPostRouter: BaseRouter {

    var path: String {
        return "/twit"
    }

    var method: HTTPMethod {
        return .post
    }

    var header: HeaderType {
        return .auth
    }

    var parameters: RequestParams {
        switch self {
        case .postTwit(let content, let writer):
            let body: [String:Any] = [
                "content": content,
                "writer" : [
                    "_id" : writer.id,
                    "userName" : writer.userName
                    ]
            ]
            return .requestBody(body)
        }
    }
}
