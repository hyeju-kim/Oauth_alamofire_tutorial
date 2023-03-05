//
//  LoginView.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/03.
//

import Foundation
import SwiftUI

struct LoginView : View {
    
    @EnvironmentObject var userVM : UserVM
     
     @Environment(\.dismiss) var dismiss
     
     @State fileprivate var shouldShowAlert : Bool = false
     
    @State var emailInput : String = ""
    @State var passwordInput : String = ""
    
    var body: some View {
        VStack{
            Form{
                Section(header: Text("로그인 정보"), content: {
                    TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none) //대문자부터 시작 안 하게
                    SecureField("비밀번호", text: $passwordInput).keyboardType(.default) //비밀번호 노출 안되기위해 SecureField
                })
                    Section {
                 Button(action: {
                 print("로그인 버튼 클릭")
                 userVM.login(email: emailInput, password: passwordInput)
                 }, label: {
                 Text("로그인 하기")
                 })
                 }
                 }
                 .onReceive(userVM.loginSuccess, perform: {
                 print("LoginView - loginSuccess() called")
                 self.shouldShowAlert = true
                 })
                 .alert("로그인이 완료되었습니다.", isPresented: $shouldShowAlert){
                 Button("확인", role: .cancel){
                 self.dismiss()
                 }
                 }
            }.navigationTitle("로그인 하기")
        }
    }
    
#if DEBUG
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
#endif
    

