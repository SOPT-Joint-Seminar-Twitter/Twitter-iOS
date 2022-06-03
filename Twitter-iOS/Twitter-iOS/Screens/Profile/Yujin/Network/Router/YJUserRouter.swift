//
//  UserRouter.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/06/01.
//

import Foundation
import Alamofire
import UIKit

enum YJUserRouter {
    case getUser
    case getList
    case postLike(postId : String)
}

extension YJUserRouter : BaseRouter {
    
    var method: HTTPMethod {
        switch self{
        case .getUser, .getList:
            return .get
        case .postLike:
            return .post
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getList, .getUser, .postLike:
            return .requestPlain
        }
    }
    
    var header: HeaderType {
        return .auth
    }
    
    var path : String {
        switch self {
        case .getUser:
            return "/user"
        case .getList:
            return "/twit"
        case .postLike(let postId):
            return "/like/\(postId)"
        }
    }
}
