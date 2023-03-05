//
//  UserData.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/03.
//

import Foundation

//"user": {
//        "id": 3,
//        "name": "tester01",
//        "email": "tester01@email.com",
//        "avatar": "https://www.gravatar.com/avatar/b87c0cd09c8c06be1d50f18d2104c814.jpg?s=200&d=robohash"
//    }

struct UserData : Codable, Identifiable { //서버에서 받아오는 거라 Codable, 고유하니까 Identifiable
    var uuid: UUID = UUID()
    var id : Int
    var name: String
    var email: String
    var avatar: String
    private enum CodingKeys: String, CodingKey{
        case id
        case name
        case email
        case avatar
    }
}
// 서버에서 넘어온 사용자 데이터
