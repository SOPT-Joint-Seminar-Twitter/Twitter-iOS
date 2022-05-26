//
//  AuthService.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/27.
//

import Foundation
import UIKit
import Alamofire

/*
 AuthService : 실제 서버통신을 하기 위해 Service 함수를 구현하는 클래스
 싱글턴으로 접근한다. 앞서 만든 request 함수를 호출하고 Router를 통해 서버통신 수행
 네트워크 결과를 받아와서 처리
 */

class AuthService: BaseService {
    static let shared = AuthService()

    private override init() { }

    /// [POST] 로그인
    func requestSignIn(email: String, pw: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.request(AuthRouter.signIn(email: email, pw: pw))
            .validate(statusCode: 200...500)
            .responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let data = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, data, SignIn.self)

                completion(networkResult)

            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    /// [POST] 회원가입
    func requestSignUp(email: String, name: String, pw: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.request(AuthRouter.signUp(email: email, name: name, pw: pw))
            .validate(statusCode: 200...500)
            .responseData { response in
                switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let data = response.data else { return}
                    let networkResult = self.judgeStatus(by: statusCode, data, SignUp.self)

                    completion(networkResult)

                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }

    /// [POST] 이미지 업로드 예시
    func uploadPicture(completion: @escaping (NetworkResult<Any>) -> (Void)) {
        AFmanager.upload(
            multipartFormData: AuthRouter.upload(image: UIImage()).multipart,
            with: AuthRouter.upload(image: UIImage())).responseData { response in
                switch response.result {
                case .success:
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let data = response.data else { return}
                    let networkResult = self.judgeStatus(by: statusCode, data, SignIn.self)

                    completion(networkResult)

                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    }
}

/*
 // viewcontroller 에서 사용하는 방법

 private func postSignIn() {
     guard let email = emailTextField.text,
           let password = passwordTextField.text
     else { return }

     AuthService.shared.requestSignIn(email: email, pw: password) { result in
         switch result {
         case .success:
             self.makeAlert(title: "로그인성공") { _ in
                 self.coordinator.transitionToFeed()
             }
         case .requestErr(let status):
             guard let status = status as? Int else { return }

             switch status {
             case 404:
                 self.makeAlert(title: "이메일에 해당하는 사용자정보가 없습니다.")
             case 409:
                 self.makeAlert(title: "비밀번호가 올바르지 않습니다.")
             default:
                 self.makeAlert(title: "아이디와 비밀번호를 다시 확인해주세요.")
             }

         case .pathErr:
             print("pathErr")
         case .serverErr:
             print("serverErr")
         case .networkFail:
             print("networkFail")
         }
     }
 }

 private func postSignUp() {
     guard let name = userName,
           let email = userName,
           let password = password
     else { return }

     AuthService.shared.requestSignUp(email: email, name: name, pw: password) { result in
         switch result {
         case .success:
             self.makeAlert(title: "회원가입 성공") { UIAlertAction in
                 self.dismiss(animated: true) {
                     self.coordinator.transitionToLogin()
                 }
             }
         case .requestErr(let status):
             guard let status = status as? Int else { return }

             switch status {
             case 409:
                 self.makeAlert(title: "동일한 이메일로 생성된 계정이 존재합니다.")
             default:
                 self.makeAlert(title: "아이디와 비밀번호를 확인해주세요.")
             }

         case .pathErr:
             print("pathErr")
         case .serverErr:
             print("serverErr")
         case .networkFail:
             print("networkFail")
         }
     }
 }

 AuthService.shared.uploadPicture() { networkResult in
     switch networkResult {

     case .success(_):
         break;
     default: break;
     }
 }
 
 */
