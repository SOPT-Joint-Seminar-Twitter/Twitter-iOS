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
    
//    var multipart: MultipartFormData {
//        switch self {
//        case .upload(let image):
//            let multiPart = MultipartFormData()
//
//            let images = image
//
//            let contentStr = "안녕하세요"
//            let userNameStr = "안현주친구"
//            let profileURL = "https://thesopt.s3.ap-northeast-2.amazonaws.com/sample-profile-picture.png"
//
//            let content = contentStr.data(using: .utf8) ?? Data()
//            let userprofile = profileURL.data(using: .utf8) ?? Data()
//            let userName = userNameStr.data(using: .utf8) ?? Data()
//            let imageData = images.pngData() ?? Data()
//
//            multiPart.append(content, withName: "content")
//            multiPart.append(userName, withName: "userName")
//            multiPart.append(userprofile, withName: "userProfileImage")
//            multiPart.append(imageData, withName: "image", fileName: "profileImage.png", mimeType: "image/png")
//
//            return multiPart
//
//        default: return MultipartFormData()
//        }
//    }

    
}
