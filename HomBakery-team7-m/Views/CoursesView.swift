//
//  CoursesView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//


import SwiftUI

struct CoursesView: View {

    @StateObject private var viewModel = CoursesViewModel()

    var body: some View {
        NavigationStack {
            VStack {

                SearchTextfield(text: .constant("restaurant"))
                    .padding()

                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 8) {
                            ForEach(viewModel.courses) { course in
                                CourseCard(course: course)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Courses")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.loadCourses()
            }
        }
    }
}
