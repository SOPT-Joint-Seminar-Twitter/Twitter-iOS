//
//  AuthRouter.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/27.
//

import Foundation
import Alamofire
import UIKit

/*
 AuthRouter : 여러 Endpoint들을 갖고 있는 enum
 BaseRouter를 채택해서 path, method, header, parameter를 각 라우터에 맞게 request를 만든다.
 */

enum AuthRouter {
    case signIn(email: String, pw: String)
    case signUp(email: String, name: String, pw: String)
    case upload(image: UIImage)
}

extension AuthRouter: BaseRouter {

    var path: String {
        switch self {
        case .signIn:
            return "/auth/signin"
        case .signUp:
            return "/auth/signup"
            /// get 할땐 .getUser(let name):
            ///     return "/feed/\(name)"
        case .upload:
            return "http://3.39.190.107:5000/feed"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .signIn, .signUp:
            return .post
        case .upload:
            return .post
        }
    }

    var header: HeaderType {
        switch self {
        case .signIn, .signUp:
            return .basic
        case .upload:
            return .multiPart
        }
    }

    var multipart: MultipartFormData {
        switch self {
        case .upload(let image):
            let multiPart = MultipartFormData()

            let images = image

            let contentStr = "안녕하세요"
            let userNameStr = "안현주친구"
            let profileURL = "https://thesopt.s3.ap-northeast-2.amazonaws.com/sample-profile-picture.png"

            let content = contentStr.data(using: .utf8) ?? Data()
            let userprofile = profileURL.data(using: .utf8) ?? Data()
            let userName = userNameStr.data(using: .utf8) ?? Data()
            let imageData = images.pngData() ?? Data()

            multiPart.append(content, withName: "content")
            multiPart.append(userName, withName: "userName")
            multiPart.append(userprofile, withName: "userProfileImage")
            multiPart.append(imageData, withName: "image", fileName: "profileImage.png", mimeType: "image/png")

            return multiPart

        default: return MultipartFormData()
        }
    }

    var parameters: RequestParams {
        switch self {
        case .signUp(let email, let name, let pw):
            let body: [String:Any] = [
                "email": email,
                "name": name,
                "password":pw
            ]
            return .requestBody(body)
        case .signIn(let email, let pw):
            let body: [String:Any] = [
                "email": email,
                "password": pw
            ]
            return .requestBody(body)
        case .upload:
            return .requestPlain
        }
    }
}
