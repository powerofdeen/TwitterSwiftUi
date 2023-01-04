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
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
