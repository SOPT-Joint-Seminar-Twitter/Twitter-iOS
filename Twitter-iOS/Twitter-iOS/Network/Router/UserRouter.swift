//
//  UserRouter.swift
//  Twitter-iOS
//
//  Created by 김민재 on 2022/05/31.
//

import Foundation
import Alamofire

enum UserRouter {
    case getUserInfo
    case getTwitList
    case likeTwit(postId: String)
}

extension UserRouter: BaseRouter {
    
    var path: String {
        switch self {
        case .getUserInfo:
            return "/user"
        case .getTwitList:
            return "/twit"
        case .likeTwit(let postId):
            return "/like/\(postId)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getUserInfo, .getTwitList:
            return .get
        case .likeTwit:
            return .post
        }
    }

    var header: HeaderType {
        switch self {
        case .getUserInfo, .getTwitList, .likeTwit:
            return .auth
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getUserInfo, .getTwitList, .likeTwit:
            return .requestPlain
        }
    }
    
    
}
