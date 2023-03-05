//
//  UserListResponse.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/05.
//

import Foundation
// MARK: - UserListResponse
struct UserListResponse: Codable {
    let data: [UserData]
}
