//
//  ContentView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//
import SwiftUI
struct HomeView: View {

    @State private var isExist: Bool = false
    @StateObject var chefsLoader = ChefsLoader()
    @State private var courses: [Courses] = []
    private var viewModel = CourseService()

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()

            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {

                        // 🔹 قائمة الشيفات (GET chefs)
                        ForEach(chefsLoader.chefs, id: \.id) { chef in
                            Text(chef.fields.name)
                                .padding(.horizontal)
                        }

                        // 🔹 Upcoming
                        Text("Upcoming")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.horizontal)

                        if isExist {

                        } else {
                            NoBookedCourses()
                        }

                        // 🔹 Popular courses
                        Text("Popular courses")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.horizontal)

                        LazyVStack(spacing: 8) {
                            ForEach(courses) { course in
                                CourseCard(course: course)
                                    EventCard(course: course, onTap: {})
                                    .padding(.horizontal)
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle("Home Bakery")
                .navigationBarTitleDisplayMode(.inline)
            }
                    .task {
            do {
                courses = try await viewModel.fetchCourses()
            } catch let error as backeryError {
                switch error {
                case .invalidURL:
                    print("❌ Invalid URL")
                case .invalidResponseFromServer:
                    print("❌ Invalid response from server")
                case .invalidData:
                    print("❌ Invalid data")
                }
            } catch {
                print("❌ Unexpected error: \(error.localizedDescription)")
            }
        }
        }
   .onAppear {       chefsLoader.loadChefs()       }
    }
}

