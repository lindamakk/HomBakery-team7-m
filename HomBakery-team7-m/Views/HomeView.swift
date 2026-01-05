//
//  ContentView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//
import SwiftUI

struct HomeView: View {
    @State private var isExist = false
    @StateObject private var chefsViewModel = ChefsViewModel()
    @StateObject private var coursesViewModel = CoursesViewModel()
    @StateObject private var bookingViewModel = BookingViewModel()

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
                        Text("Upcoming")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.horizontal)
                        
                       
                        if let firstCourse = bookingViewModel.bookedCourses.first {
                                                  EventCard(
                                                      startDate: TimeInterval(firstCourse.fields.startDate),
                                                      title: firstCourse.fields.title,
                                                      location: firstCourse.fields.locationName,
                                                      time: formattedTime(
                                                          start: TimeInterval(firstCourse.fields.startDate),
                                                          end: TimeInterval(firstCourse.fields.endDate)
                                                      )
                                                  ).padding()
                                              }
 else {
                            NoBookedCourses()
                                .frame(maxWidth: .infinity, alignment: .center).padding()
                        }
                        
                        // 🔹 Popular courses
                        Text("Popular courses")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.horizontal)
                        
                        // Only show the big loading spinner for the INITIAL load
                        if coursesViewModel.isLoading && coursesViewModel.courses.isEmpty {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .padding()
                        } else if let error = coursesViewModel.errorMessage {
                            Text(error)
                                .foregroundColor(.red)
                                .padding()
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
            .navigationTitle("Home Bakery")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {

            await coursesViewModel.loadCourses()
            await bookingViewModel.loadBooking()
            await bookingViewModel.getUserBooking(
                              userID: "123",
                              allCourses: coursesViewModel.courses
                          )

        }
    }
}

