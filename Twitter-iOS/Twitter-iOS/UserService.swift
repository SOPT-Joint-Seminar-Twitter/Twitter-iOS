//
//  UserService.swift
//  Twitter-iOS
//
//  Created by 김민재 on 2022/05/31.
//

import Foundation
import UIKit
import Alamofire

// 변수 변경할 경우 or 상속
class UserService: BaseService {
    static let shared = UserService()

    private override init() { }

    func getUserInfo(completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.request(UserRouter.getUserInfo)
            .validate(statusCode: 200...500)
            .responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, UserResponse.self)

                completion(networkResult)

            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func getTwitList(completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.request(UserRouter.getTwitList)
            .validate(statusCode: 200...500)
            .responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, [Twit].self)

                completion(networkResult)

            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func likeTwit(postId: Int, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.request(UserRouter.likeTwit(postId: postId))
            .validate(statusCode: 200...500)
            .responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, Like.self)

                completion(networkResult)

            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
