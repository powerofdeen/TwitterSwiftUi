//
//  TwitterSwiftUiApp.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/02.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUiApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                ContentView()
                LoginView()
            }
        }
    }
}
