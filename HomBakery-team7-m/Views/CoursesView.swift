//
//  CoursesView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI
import SwiftData

struct CoursesView: View {
    
    
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
