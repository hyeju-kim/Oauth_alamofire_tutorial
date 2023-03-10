//
//  OtherUserProfileView.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/03.
//

import Foundation
import SwiftUI

//다른 사용자 프로필
struct OtherUserProfileView : View {

    var userData : UserData
    
    var body: some View {
        VStack(alignment: .center){
            Form{
                Section{
                    HStack{
                        Spacer()
                        AsyncImage(url: URL(string: userData.avatar)!) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 250, height: 250, alignment: .center)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 250, height: 250, alignment: .center)
                            case .failure:
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
                        Spacer()
                    }
                }
                Section(header: Text("아이디").font(.callout)){
                    Text("아이디: \(userData.id)")
                }
                Section(header: Text("이름").font(.callout)){
                    Text("이름: \(userData.name)")
                }
                Section(header: Text("이메일").font(.callout)){
                    Text("이메일: \(userData.email)")
                }
            }
        }.navigationTitle(userData.name) //사용자 이름을 navigationTitle에 넣음
    }
}
