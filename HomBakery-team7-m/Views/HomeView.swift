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
                            EventCard(
                                month: "Jan",
                                day: "15",
                                title: "Chocolate Cake",
                                location: "123 Baker Street",
                                time: "18:00",
                                onTap: {}
                            )
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
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle("Home Bakery")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
   .onAppear {       chefsLoader.loadChefs()       }
    }
}
