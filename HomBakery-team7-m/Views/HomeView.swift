//
//  ContentView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {

    var isExist: Bool = false
    var body: some View {
        ZStack {
            Color("AppBackground")
                            .ignoresSafeArea()
            
            NavigationStack {
                
                VStack(alignment: .leading){
                    SearchTextfield(text: .constant(""))
                    .padding()
                    Text("Upcoming")
                        .padding()
                    .font(.system(size: 24, weight: .semibold));
                }
                

                    
                    if isExist{
                        EventCard(month: "Jan", day: "15", title: "Chocolate Cake", location: "123 Baker Street", time: "18:00", onTap: {})
                    }
                    else{
                        NoBookedCourses()
                    }
                    
                VStack(alignment: .leading){
                    Text("Popular courses")
                        .padding()
                    .font(.system(size: 24, weight: .semibold));
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
                    
                    
                }//v
            }//nav
    }
    }}

#Preview {
    HomeView()
}


