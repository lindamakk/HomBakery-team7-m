//
//  ContentView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//
import SwiftUI
struct HomeView: View {

    @State private var isExist: Bool = false
    @StateObject var chefsLoader = ChefsViewModel()
    @State private var courses: [Courses] = []
    @StateObject private var coursesVM = CoursesViewModel()

    private var viewModel = CourseService()

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()

            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {

//                        // 🔹 Chefs
//                        Text("Chefs")
//                            .font(.system(size: 24, weight: .semibold))
//                            .padding(.horizontal)
//
//                        if chefsViewModel.isLoading {
//                            ProgressView()
//                                .padding()
//                        } else if let error = chefsViewModel.errorMessage {
//                            Text(error)
//                                .foregroundColor(.red)
//                                .padding()
//                        } else {
//                            ForEach(chefsViewModel.chefs, id: \.id) { chef in
//                                Text(chef.fields.name)
//                                    .padding(.horizontal)
//                            }
//                        }

                        // 🔹 Upcoming
                        Text("Upcoming")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.horizontal)

                        if isExist {
                            EmptyView()
                        } else {
                            NoBookedCourses()
                        }

                        // 🔹 Popular courses
                        Text("Popular courses")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.horizontal)

                        if  coursesVM.isLoading {
                            ProgressView()
                                .padding()
                        } else if let error = coursesVM.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .padding()
                        } else {
                            LazyVStack(spacing: 8) {
                                ForEach(coursesVM.courses) { course in
                                    CourseCard(course: course)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Home Bakery")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .task {
            // Load data when view appears
            await chefsLoader.loadChefs()
            await coursesVM.loadCourses()
        }
    }
}

