//
//  TweetModel.swift
//  Twitter-iOS
//
//  Created by 김민재 on 2022/05/18.
//

import UIKit

struct TweetResponse: Codable {
    let profileName: String
    var profileImage: String
    let profileID: String
    let createdAt: String
    let content: String
}


extension TweetResponse {
    static var sampleData: [TweetResponse] = [
        TweetResponse(profileName: "마먁", profileImage: "imgProfile5", profileID: "hoho_0518", createdAt: "2초", content: "트위터로 글 작성하기~! 안드!🐤"),
        TweetResponse(profileName: "청주여자교도소", profileImage: "imgProfile4", profileID: "lesjail", createdAt: "1일", content: "누가 날 깎아내랴도 아 내가 조각이구나 하고 사는 마음가짐"),
        TweetResponse(profileName: "tarae", profileImage: "imgProfile3", profileID: "nothingbuttfg", createdAt: "3일", content: "샤워, 잠 , 운동 이 세가지의 공통점은 이들은 모두잡다한 번뇌와 고민으로부터 잠시 분리되어 오로지 나 자신에게만 집중하는 시간이라는 것에 있다. 삶을 유지하는 것에는 의도적인 쉼이 필요하다. 고속도로 처럼 바쁘고 빠른 일상 속에도 반드시 중간중간 휴게소룰 설치해놔야 하는 이유."),
        TweetResponse(profileName: "darjeelingt", profileImage: "imgProfile2", profileID: "darjeelingt", createdAt: "2일", content: "아무도 \"권하지 않는다\" 와\"개발 취준생\" 을 읽지않는 사소한 문제가 있군요.정규분포에 따라 경력이 많거나 자신이 있는 분은 제외됩니다. 대략 상위 20% ~ 30%는 상관이 없습니다. 취준인데 내가 만들고 싶은걸 헤딩해서 만들수 있다면 당연히 해당안됩니다."),
        TweetResponse(profileName: "darjeelingt", profileImage: "imgProfile2", profileID: "darjeelingt", createdAt: "2일", content: "아무도 \"권하지 않는다\" 와\"개발 취준생\" 을 읽지않는 사소한 문제가 있군요.정규분포에 따라 경력이 많거나 자신이 있는 분은 제외됩니다. 대략 상위 20% ~ 30%는 상관이 없습니다. 취준인데 내가 만들고 싶은걸 헤딩해서 만들수 있다면 당연히 해당안됩니다."),
        TweetResponse(profileName: "darjeelingt", profileImage: "imgProfile2", profileID: "darjeelingt", createdAt: "2일", content: "아무도 \"권하지 않는다\" 와\"개발 취준생\" 을 읽지않는 사소한 문제가 있군요.정규분포에 따라 경력이 많거나 자신이 있는 분은 제외됩니다. 대략 상위 20% ~ 30%는 상관이 없습니다. 취준인데 내가 만들고 싶은걸 헤딩해서 만들수 있다면 당연히 해당안됩니다.")
        
    ]
}
