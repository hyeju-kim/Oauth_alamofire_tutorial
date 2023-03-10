//
//  UserVM.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/05.
//

import Foundation
import Alamofire
import Combine

class UserVM: ObservableObject { //퍼블리셔 변경을 감지하기 위해
    
    //MARK: properties
    var subscription = Set<AnyCancellable>()
    
    @Published var loggedInUser: UserData? = nil
    
    @Published var users : [UserData] = []
    
    // 회원가입 완료 이벤트
    var registrationSuccess = PassthroughSubject<(), Never>() //아무 데이터도 안 보낼 때
    
    // 로그인 완료 이벤트
    var loginSuccess = PassthroughSubject<(), Never>()
    
    /// 회원가입 하기
    func register(name: String, email: String, password: String){
        print("UserVM: register() called")
        AuthApiService.register(name: name, email: email, password: password)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
                self.registrationSuccess.send()
            }.store(in: &subscription)
    }
    
    /// 로그인 하기
    func login(email: String, password: String){
        print("UserVM: login() called")
        AuthApiService.login(email: email, password: password)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
                self.loginSuccess.send()
            }.store(in: &subscription)
    }
    
    // 현재 사용자 정보 가져오기
    func fetchCurrentUserInfo(){
        print("UserVM - fetchCurrentUserInfo() called")
        UserApiService.fetchCurrentUserInfo()
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM fetchCurrentUserInfo completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                print("UserVM fetchCurrentUserInfo receivedUser: \(receivedUser)")
                self.loggedInUser = receivedUser
            }.store(in: &subscription)
    }
    
    // 모든 사용자 가져오기
    func fetchUsers(){
        print("UserVM - fetchUsers() called")
        UserApiService.fetchUsers()
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM fetchUsers completion: \(completion)")
            } receiveValue: { (fetchedUsers: [UserData]) in
                print("UserVM fetchUsers fetchedUsers.count: \(fetchedUsers.count)")
                self.users = fetchedUsers
            }.store(in: &subscription)
    }
    
}
