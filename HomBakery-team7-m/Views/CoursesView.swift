//
//  CoursesView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//


import SwiftUI

struct CoursesView: View {
    
    @StateObject private var viewModel = CoursesViewModel()
    @State private var searchText = "" // Added to handle search input

    var body: some View {
        NavigationStack {
            VStack {
                // Binding the text to a state variable so users can actually type
                SearchTextfield(text: $searchText)
                    .padding()

                if viewModel.isLoading && viewModel.courses.isEmpty {
                    ProgressView()
                        .frame(maxHeight: .infinity)
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Text("Error")
                            .font(.headline)
                        Text(error)
                            .font(.subheadline)
                    }
                    .foregroundColor(.red)
                    .frame(maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(viewModel.courses) { course in
                                CourseCard(course: course) {
                                    
                                    Task {
                                        await viewModel.loadCoursesById(by: course.id)
                                    }
                                }
                                .padding(.horizontal)
                                // Prevent multiple taps while loading
                                .disabled(viewModel.isLoading)
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
        
            .navigationDestination(item: $viewModel.selectedCourse) { course in
                CourseDetailsView(selectedCourse: course)
            }
            .navigationTitle("Courses")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                
                await viewModel.loadCourses()
            }
        }
    }
}
