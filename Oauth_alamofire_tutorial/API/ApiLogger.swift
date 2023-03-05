//
//  ApiLogger.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/04.
//

import Foundation
import Alamofire

final class ApiLogger: EventMonitor {
    let queue = DispatchQueue(label: "Oauth_alamofire_tutorial_ApiLogger")
    
    // Event called when any type of Request is resumed.
    func requestDidResume(_ request: Request) {
        print("ApiLogger - Resuming: \(request)")
    }
    
    // Event called whenever a DataRequest has parsed a response.
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint("ApiLogger - Finished: \(response)")
    }
}
