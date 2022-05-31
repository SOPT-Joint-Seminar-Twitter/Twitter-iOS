//
//  TwitPostService.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/28.
//

import Foundation
import UIKit
import Alamofire

class TwitPostService: BaseService {
    static let shared = TwitPostService()

    private override init() { }

    func postTwit(content: String, writer: Writer, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.request(TwitPostRouter.postTwit(content: content, writer: writer))
            .validate(statusCode: 200...500)
            .responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, Writer.self)

                completion(networkResult)

            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
