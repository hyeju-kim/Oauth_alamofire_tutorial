//
//  AuthResponse.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/05.
//

import Foundation

struct AuthResponse : Codable {
    var user: UserData
    var token: TokenData
    enum CodingKeys: String, CodingKey {
        case token
        case user
    }
}
