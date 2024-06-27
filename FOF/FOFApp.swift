//
//  FOFApp.swift
//  FOF
//
//  Created by Harishkathir on 18/08/23.
//

import SwiftUI
import Firebase

@main
struct FOFApp: App {
    @StateObject var viewModel = AuthViewModel()
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
