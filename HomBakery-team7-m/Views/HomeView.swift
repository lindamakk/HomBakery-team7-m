//
//  ContentView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//
import SwiftUI
import SwiftUI

struct HomeView: View {

    @State private var isExist = false
    @StateObject private var chefsViewModel = ChefsViewModel()
    @StateObject private var coursesViewModel = CoursesViewModel()

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
                                .frame(maxWidth: .infinity,alignment: .center)
                        }

                        // 🔹 Popular courses
                        Text("Popular courses")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.horizontal)

                        if coursesViewModel.isLoading {
                            ProgressView()
                                .padding()
                        } else if let error = coursesViewModel.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .padding()
                        } else {
                            LazyVStack(spacing: 8) {
                                ForEach(coursesViewModel.courses) { course in
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
            await chefsViewModel.loadChefs()
            await coursesViewModel.loadCourses()
        }
    }
}
