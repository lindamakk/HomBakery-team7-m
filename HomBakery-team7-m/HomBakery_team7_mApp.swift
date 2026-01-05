//
//  HomBakery_team7_mApp.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//


import SwiftUI
import SwiftData

import SwiftUI
import SwiftData

@main
struct HomBakery_team7_mApp: App {

    @State private var showLoginSheet = !AuthManager.isLoggedIn

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainTabView()
                    .task {
                        await UsersRepository.shared.loadUsersIfNeeded()
                        //when i open app user data load from disk
                        UsersRepository.shared.loadCurrentUser()
                    }
                    .sheet(isPresented: $showLoginSheet) {
                        LogInView {
                            // ✅ called on successful login
                            AuthManager.isLoggedIn = true
                            showLoginSheet = false
                        }
                        .presentationDetents([.large])
                        .presentationDragIndicator(.visible)
                        .interactiveDismissDisabled()
                    }
            }
        }
    }
}

//@main
//struct HomBakery_team7_mApp: App {
//
//    @State private var showLoginSheet = true   // 👈 show login on launch
//
//    var body: some Scene {
//        WindowGroup {
//            NavigationStack {
//
//                // 🔹 Your main/root view
//                MainTabView()
//                    .task {
//                        await UsersRepository.shared.loadUsersIfNeeded()
//                    }
//                    .sheet(isPresented: $showLoginSheet) {
//                        LogInView()
//                            .presentationDetents([.large, .large])
//                            .presentationDragIndicator(.visible)
//                            //.interactiveDismissDisabled() // ❗ prevents swipe down before login
//                    }
//            }
//        }
//    }
//}

//
//@main
//struct HomBakery_team7_mApp: App {
//    
//    @State private var showSplash = true
//
//    
//    var body: some Scene {
//        WindowGroup {
//            
////            RootView()
//            LogInView()
//                .task {
//                    await UsersRepository.shared.loadUsersIfNeeded()
//                }
////            ZStack {
////                if showSplash {
////                    SplashView()
////                        .transition(.opacity.combined(with: .scale))
////                } else {
////                    MainTabView()
////                        .transition(.opacity.combined(with: .scale))
////                }
////            }
////            .animation(.easeInOut(duration: 0.6), value: showSplash)
////            .onAppear {
////                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
////                    showSplash = false
////                }
////            }
//           
//        }//group
//        
//    }//view
//    
//    
// 
//}//class
//
////            HomeView()
//        
//
//
