//
//  ContentView.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                Image(systemName: "lock.circle")
                    .font(.system(size: 160)) //아이콘 크기
                Spacer()
                NavigationLink(destination: LoginView(), label: {
                    HStack{
                        Spacer()
                        Text("로그인 하러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                }) //destination: 넘어가는 화면, label: 실제 보여주는 부분
                .padding([.bottom], 10)
                NavigationLink(destination: RegisterView(), label: {
                    HStack{
                        Spacer()
                        Text("회원가입 하러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                
                Spacer().frame(height: 40) //간격두기
                NavigationLink(destination: ProfileView(), label: {
                    HStack{
                        Spacer()
                        Text("내 프로필 보러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                .padding([.bottom], 10) //아래 간격
                NavigationLink(destination: UserListView(), label: {
                    HStack{
                        Spacer()
                        Text("사용자 목록 보러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                Spacer()
                Spacer() //간격 맞추기
        }//VStack
            .padding() //화면에 맞춰짐!
        }//NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
