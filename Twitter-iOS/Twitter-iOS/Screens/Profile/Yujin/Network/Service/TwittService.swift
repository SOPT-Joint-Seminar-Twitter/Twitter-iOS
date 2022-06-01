//
//  TwittService.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/06/01.
//

import Foundation
import UIKit
import Alamofire

class TwittService : BaseService {
    
    static let shared = TwittService()
    
    private override init() { }
    
    func getUser (completion : @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.request(UserRouter.getUser)
            .validate(statusCode: 200...500)
            .responseData { response in
                switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else {return}
                    guard let data = response.data else {return}
                    let networkResult = self.judgeStatus(by: statusCode, data, UserResponse.self)
                    completion(networkResult)
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
    func getList(completion : @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.request(UserRouter.getList)
            .validate(statusCode: 200...500)
            .responseData { response in
                switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode
                    else {return}
                    guard let data = response.data else {return}
                    let networkResult = self.judgeStatus(by: statusCode, data,TwittResponse.self)
                    completion(networkResult)
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
    func postLike(postId : String, completion : @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.request(UserRouter.postLike(postId: postId))
            .validate(statusCode: 200...500)
            .responseData { response in
                switch response.result {
                case .success :
                    guard let statusCode = response.response?.statusCode else {return}
                    guard let data = response.data else {return}
                    
                    let networkResult = self.judgeStatus(by: statusCode, data, LikeResponse.self)
                    completion(networkResult)
                    
                case .failure(let err):
                    print(err.localizedDescription)
                }
                
            }
        
    }
}
