//
//  OAuthCredential.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/05.
//

import Foundation
import Alamofire

struct OAuthCredential : AuthenticationCredential {
    
    let accessToken: String
    
    let refreshToken: String
    
    let expiration: Date
    
    // Require refresh if within 5 minutes of expiration
    var requiresRefresh: Bool { Date(timeIntervalSinceNow: 60 * 5) > expiration }
    //5분이 지나면 토큰 재발행 됨
    
}
