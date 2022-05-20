//
//  MyTwittModel.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/20.
//

import UIKit
struct MyTwittModel {
    let profileImageName : String
    var profileImage : UIImage? {
        return UIImage(named: profileImageName)
    }
    let nickName : String
    let content : String
    let id : String
    let time : String
    var idLabel : String? {
        return "@\(id) · \(time)초"
    }
}
extension MyTwittModel {
    static let sampleData : [MyTwittModel] = [
        MyTwittModel(profileImageName: "imgProfile1", nickName: "먀막", content: "트위터로 글 작성하기~!", id: "hoho_0518", time: "2"),
        MyTwittModel(profileImageName: "imgProfile1", nickName: "먀막", content: "트위터로 글 작성하기~!", id: "hoho_0518", time: "2"),
        MyTwittModel(profileImageName: "imgProfile1", nickName: "먀막", content: "트위터로 글 작성하기~!", id: "hoho_0518", time: "2"),
        MyTwittModel(profileImageName: "imgProfile1", nickName: "먀막", content: "트위터로 글 작성하기~!", id: "hoho_0518", time: "2"),
        MyTwittModel(profileImageName: "imgProfile1", nickName: "먀막", content: "트위터로 글 작성하기~!", id: "hoho_0518", time: "2"),
        MyTwittModel(profileImageName: "imgProfile1", nickName: "먀막", content: "트위터로 글 작성하기~!", id: "hoho_0518", time: "2")
    ]
}
