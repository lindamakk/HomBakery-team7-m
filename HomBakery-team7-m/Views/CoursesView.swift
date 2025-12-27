//
//  CoursesView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI
import SwiftData

struct CoursesView: View {
    
    //arr from api contani objects
    let courses: [CourseCardModel] = [
        CourseCardModel(
            id: 1,
            title: "SwiftUI Basics",
            description: "Learn the fundamentals",
            duration: "2h 30m",
            startDate: "24 Dec 2025",
            imageName: "fortest",
            level: .Beginner
        ),
        CourseCardModel(
            id: 2,
            title: "Intermediate SwiftUI",
            description: "Build more complex layouts",
            duration: "3h 15m",
            startDate: "10 Jan 2026",
            imageName: "fortest",
            level: .Intermediate
        ),
        CourseCardModel(
            id: 3,
            title: "Intermediate SwiftUI",
            description: "Build more complex layouts",
            duration: "3h 15m",
            startDate: "10 Jan 2026",
            imageName: "fortest",
            level: .Intermediate
        ),
        CourseCardModel(
            id: 4,
            title: "Intermediate SwiftUI",
            description: "Build more complex layouts",
            duration: "3h 15m",
            startDate: "10 Jan 2026",
            imageName: "fortest",
            level: .Intermediate
        ),
        CourseCardModel(
            id: 5,
            title: "Intermediate SwiftUI",
            description: "Build more complex layouts",
            duration: "3h 15m",
            startDate: "10 Jan 2026",
            imageName: "fortest",
            level: .Intermediate
        ),
        CourseCardModel(
            id: 6,
            title: "Intermediate SwiftUI",
            description: "Build more complex layouts",
            duration: "3h 15m",
            startDate: "10 Jan 2026",
            imageName: "fortest",
            level: .Advanced
        )
    ]
    
    var body: some View {
        NavigationStack {
            VStack () {
 
                SearchTextfield(text: .constant("restaurent"))
                    .padding()
                
                //i will make for ech print card compnent with date from object i passed from api array
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(courses) { course in
                            CourseCard(course: course)
                        }
                    }
                    .padding()
                }
                .navigationTitle("Courses")
                .navigationBarTitleDisplayMode(.inline)

                
                
            }//V
            
            
        }//nav
    }//body
}//struct

#Preview {
    CoursesView()
}
