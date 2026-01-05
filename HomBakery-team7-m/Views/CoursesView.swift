//
//  CoursesView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI

struct CoursesView: View {

    @StateObject private var viewModel = CoursesViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            VStack {

                SearchTextfield(text: $searchText)
                    .padding()

                // 🔄 LOADING
                if viewModel.isLoading {
                    Spacer()
                    ProgressView()
                    Spacer()
                }

                // ❌ ERROR FROM SERVER
                else if let error = viewModel.errorMessage {
                    ErrorCoursesView {
                        Task {
                            await viewModel.loadCourses()
                        }
                    }
                }

                // ✅ SUCCESS
                else {
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(viewModel.courses) { course in
                                CourseCard(course: course) {
                                    Task {
                                        await viewModel.loadCoursesById(by: course.id)
                                    }
                                }
                                .padding(.horizontal)
                                .disabled(viewModel.isLoading)
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
            // 🔀 Navigation
            .navigationDestination(item: $viewModel.selectedCourse) { course in
                CourseDetailsView(selectedCourse: course)
            }
            .navigationTitle("Courses")
            .navigationBarTitleDisplayMode(.inline)

            //  Initial load
            .task {
                await viewModel.loadCourses()
            }
        }
    }
}

#Preview {
    CoursesView()
}
