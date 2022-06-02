//
//  Auth.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/27.
//

import Foundation

/// 예시용 모델
struct SignIn: Codable {
    let name, email: String
}

struct SignUp: Codable {
    let id: Int
}
