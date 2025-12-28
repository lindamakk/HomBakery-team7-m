//
//  HomBakery_team7_mApp.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI
import SwiftData

@main
struct HomBakery_team7_mApp: App {
    
    @State private var showSplash = true
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashView()
                        .transition(.opacity.combined(with: .scale))
                } else {
                    MainTabView()
                        .transition(.opacity.combined(with: .scale))
                }
            }
            .animation(.easeInOut(duration: 0.6), value: showSplash)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showSplash = false
                }
            }
           
        }
        
    }
    
    
 
}

//            HomeView()
        


