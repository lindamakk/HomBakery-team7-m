//
//  CoursesView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//


import SwiftUI


struct CoursesView: View {
    @State private var isExist = false
    @StateObject private var chefsViewModel = ChefsViewModel()
    @StateObject private var coursesViewModel = CoursesViewModel()

    
    @State private var searchText = ""
    @State private var chefName = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground")
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack(alignment: .leading, spacing: 16) {
                        SearchTextfield(text: $searchText).padding()
                        // Only show the big loading spinner for the INITIAL load
                        if coursesViewModel.isLoading && coursesViewModel.courses.isEmpty {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .padding()
                        }    else if let error = coursesViewModel.errorMessage {
                            ErrorCoursesView {
                                Task {
                                    await coursesViewModel.loadCourses()
                                }
                            }
                        
                        } else {
                            LazyVStack(spacing: 8) {
                                ForEach(coursesViewModel.courses) { course in
                                    CourseCard(course: course) {
                                       
                                        Task {
                                                
                                                await chefsViewModel.loadChefById(by: course.fields.chefID)
                                                
                                            chefName = chefsViewModel.selectedChef?.fields.name ?? "Unknown Chef"
                                            
                                                await coursesViewModel.loadCoursesById(by: course.id)
                                            }
                                    }
                                    .padding(.horizontal)
                                    // Disable interaction while one is loading to prevent double-taps
                                    .disabled(coursesViewModel.isLoading)
                                }
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
          
            .navigationDestination(item: $coursesViewModel.selectedCourse) { course in
                CourseDetailsView(
                    selectedCourse: course,
                    chefName: chefName // Passing the pre-fetched chef
                )
            }
            .navigationTitle("Courses")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await chefsViewModel.loadChefs()
            await coursesViewModel.loadCourses()
            
        }
    }
}

