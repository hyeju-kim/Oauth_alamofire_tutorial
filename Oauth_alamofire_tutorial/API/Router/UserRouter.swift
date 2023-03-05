//
//  UserRouter.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/05.
//

import Foundation
import Alamofire

// 사용자 라우터
enum UserRouter: URLRequestConvertible {
    
    case fetchCurrentUserInfo // 현재 로그인한 사용자 정보
    case fetchUsers // 모든 사용자 가져오기
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .fetchUsers:
            return "user/all"
        case .fetchCurrentUserInfo:
            return "user/info"
        default:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default: return .get
        }
    }
    
    var parameters: Parameters{
        switch self {
        default: return Parameters()
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        
        request.method = method
        
        return request
    }
    
    
}
