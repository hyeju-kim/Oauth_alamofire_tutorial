//
//  RegisterView.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/03.
//

import Foundation
import SwiftUI

struct RegisterView : View {
    
     @EnvironmentObject var userVM : UserVM //외부에서 UserVM 생성했기 때문에 환경변수로 접근 가능
     
     @Environment(\.dismiss) var dismiss
     
     @State fileprivate var shouldShowAlert : Bool = false
     
    @State var nameInput : String = "" //이름 넣어야하니까 추가
    @State var emailInput : String = ""
    @State var passwordInput : String = ""
    
    
    
    var body: some View {
        VStack{
            Form{
                // 이름
                Section(header: Text("이름"), content: {
                    TextField("이름", text: $nameInput).keyboardType(.default)
                })
                
                // 이메일
                Section(header: Text("이메일"), content: {
                    TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
                })
                
                // 비밀번호
                Section(header: Text("로그인 정보"), content: {
                    SecureField("비밀번호", text: $passwordInput).keyboardType(.default)
                    SecureField("비밀번호 확인", text: $passwordInput).keyboardType(.default)
                })
                 Section {
                 Button(action: {
                 print("회원가입 버튼 클릭")
                 userVM.register(name: nameInput, email: emailInput, password: passwordInput)
                 }, label: {
                 Text("회원가입 하기")
                 })
                 }
                 }
                 .onReceive(userVM.registrationSuccess, perform: {
                 print("RegisterView - registrationSuccess() called")
                 self.shouldShowAlert = true
                 })
                 .alert("회원가입이 완료되었습니다.", isPresented: $shouldShowAlert){
                 Button("확인", role: .cancel){
                 self.dismiss()//창닫기
                 }
                 }
            }.navigationTitle("회원가입")
        }
    }

