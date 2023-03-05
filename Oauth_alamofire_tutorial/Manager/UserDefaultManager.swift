//
//  UserDefaultManager.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/05.
//

import Foundation

class UserDefaultsManager {
    enum Key: String, CaseIterable{
        case refreshToken, accessToken
    }
    
    static let shared: UserDefaultsManager = {
        return UserDefaultsManager()
    }()
    
    
    func clearAll(){ // 저장된 모든 데이터 지우기
        print("UserDefaultsManager - clearAll() called")
        Key.allCases.forEach{ UserDefaults.standard.removeObject(forKey: $0.rawValue) }
    }
    
    
    func setTokens(accessToken: String, refreshToken: String){ // 토큰들 저장
        print("UserDefaultsManager - setTokens() called")
        UserDefaults.standard.set(accessToken, forKey: Key.accessToken.rawValue)
        UserDefaults.standard.set(refreshToken, forKey: Key.refreshToken.rawValue)
        UserDefaults.standard.synchronize() //업데이트
    }
    
    
    func getTokens()->TokenData{ // 토큰들 가져오기
        let accessToken = UserDefaults.standard.string(forKey: Key.accessToken.rawValue) ?? ""
        let refreshToken = UserDefaults.standard.string(forKey: Key.refreshToken.rawValue) ?? ""
        return TokenData(accessToken: accessToken, refreshToken: refreshToken)
    }

    
}
