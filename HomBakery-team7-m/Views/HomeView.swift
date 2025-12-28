//
//  ContentView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {

    
    var body: some View {
        ZStack {
            Color("AppBackground")
                            .ignoresSafeArea()
            
            NavigationStack {
                
                SearchTextfield(text: .constant(""))
                    .padding()
                
                Text("Upcoming")
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(courses) { course in
                            CourseCard(course: course)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Home Bakery")
                .navigationBarTitleDisplayMode(.inline)
            }
    }
    }}

#Preview {
    HomeView()
}


