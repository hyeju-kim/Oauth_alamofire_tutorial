//
//  Oauth_alamofire_tutorialApp.swift
//  Oauth_alamofire_tutorial
//
//  Created by 김혜주 on 2023/03/03.
//

import SwiftUI

@main
struct Oauth_alamofire_tutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(UserVM())
        }
    }
}
