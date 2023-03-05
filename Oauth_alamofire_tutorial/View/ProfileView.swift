//
//  ProfileView.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/03.
//

import Foundation
import SwiftUI

struct ProfileView : View {

    @EnvironmentObject var userVM : UserVM
    
    @State var id: String = ""
    @State var name: String = ""
    @State var email: String = ""
    @State var avatarImg: String = ""
    
    var body: some View {
        VStack(alignment: .center){
            Form{
                Section{
                    HStack{ //정중앙에 맞추기 위해 앞뒤에 Spacer를 넣음
                        Spacer()
                        if !avatarImg.isEmpty {
                            AsyncImage(url: URL(string: avatarImg)!) { phase in
                                switch phase {
                                case .empty: //비어있을 때
                                    ProgressView()
                                        .frame(width: 250, height: 250, alignment: .center)
                                case .success(let image): //성공하면 이미지가 들어옴
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250, height: 250, alignment: .center)
                                case .failure: //실패했을 때
                                    Image(systemName: "person.fill.questionmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .frame(width: 250, height: 250, alignment: .center)
                                @unknown default:
                                    EmptyView()
                                        .frame(width: 250, height: 250, alignment: .center)
                                }
                            }
                        } else {
                            Image(systemName: "person.fill.questionmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .frame(width: 250, height: 250, alignment: .center)
                        }
                        Spacer()
                    }
                }
                Section{
                    Text("아이디: \(id)")
                    Text("이름: \(name)")
                    Text("이메일: \(email)")
                }
                Section{
                    Button {
                        print("새로고침 버튼 클릭")
                        userVM.fetchCurrentUserInfo() //새로고침하면 사용자 정보를 가져오도록
                    } label: {
                        Text("새로고침")
                    }

                }
            }
            .onAppear(perform: {
                print("ProfileView onAppear() called")
                userVM.fetchCurrentUserInfo()
            })
            .onReceive(userVM.$loggedInUser, perform: { loggedInUser in
                print("ProfileView onReceive() called / loggedInUser")
                guard let user = loggedInUser else { return }
                self.id = "\(user.id)"
                self.name = user.name
                self.email = user.email
                self.avatarImg = user.avatar
            })
        }.navigationTitle("로그인 하기")
    }
}
