//
//  NetworkConstants.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/21.
//

import Foundation
import Alamofire

/*
 NetworkConstants : 서버통신과정에서 필요한 상수들을 관리 -> header 관련 상수들
 */

enum HeaderType {
    case basic
    case auth
    case multiPart
    case multiPartWithAuth
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case accesstoken = "accesstoken"
    case userId = "userId"
}

enum ContentType: String {
    case json = "Application/json"
    case tokenSerial = ""
    case multiPart = "multipart/form-data"
    case userId = "1"
}
