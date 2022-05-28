//
//  ProfileModel.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/26.
//

import Foundation
import UIKit

public struct ProfileModel {
    let name : String
    let profileImageName : String
    var profileImage : UIImage? {
        return UIImage(named: profileImageName)
    }
    let instagramID : String
    let content : String
    let madeAccountYear : Int
    let madeAccountMonth : Int
    var madeAccountDate : String? {
        return "\(madeAccountYear)년 \(madeAccountMonth)월에 가입함"
    }
    let follwing : Int
    let follower : Int
}
extension ProfileModel{
    static let sampleData : [ProfileModel] = [
        ProfileModel(name: "먀막" , profileImageName: "imgProfile6", instagramID: "@hoho_0518", content: "디자인/일상/인사이트/틈새기록/구독계", madeAccountYear: 2021, madeAccountMonth: 11, follwing: 192, follower: 6)]
}
