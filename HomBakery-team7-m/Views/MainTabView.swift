//
//  TabBar.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//


import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image("Bake")
                    Text("Bake")
                }
                .tag(0)
            CoursesView()
                .tabItem {
                    Image("Courses")
                    Text("Courses")
                }
                .tag(1)
            
            ProfileView()
                .tabItem {
                    Image("Profile")
                    Text("Profile")
                }
                .tag(2)
        }
    }
}


#Preview {
    MainTabView()
}
