//
//  ApiClient.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/04.
//

import Foundation
import Alamofire

// api 호출 클라이언트
final class ApiClient { //다른 곳에서 상속 안 하도록
    
    static let shared = ApiClient() //한 번 썼던 메모리를 계속 쓰는 거임
    
    static let BASE_URL = "https://dev-jeongdaeri-oauth.tk/api" //api 수정해야함
    
    let interceptors = Interceptor(interceptors: [
        BaseInterceptor() // application/json
    ])
    
    let monitors = [ApiLogger()] as [EventMonitor]
    
    var session: Session //핵심
    
    init() {
        print("ApiClient - init() called")
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
    
}
