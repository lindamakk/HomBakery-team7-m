//
//  CourseDetailsView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//
import SwiftUI
import MapKit

struct CourseDetailsView: View {
    @StateObject private var bookingViewModel = BookingViewModel()
    @State private var showAlert = false
    @State private var showDeleteConfirmation = false
    
    let selectedCourse: Courses
    let chefName: String
    
    // placeholder
    private let currentUserID = "123"
    
    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    NetworkImage(url: selectedCourse.fields.imageURL)
                        .cornerRadius(4.5)
                        .frame(height: 275)
                        .frame(maxWidth: .infinity)
                        .clipped()

                    VStack(alignment: .leading) {
                        Spacer().frame(height: 24)
                        
                        Text("About the course:")
                            .bold()
                        
                        Spacer().frame(height: 10)
                        
                        Text(selectedCourse.fields.description)
                            .font(.subheadline)

                        Spacer().frame(height: 24)
                        Divider()
                        Spacer().frame(height: 24)
                        
                        CourseDetailsTable(
                            chefName: chefName,
                            level: selectedCourse.fields.level,
                            duration: "2h",
                            dateTime: selectedCourse.fields.startDateString,
                            location: selectedCourse.fields.locationName
                        )
                        
                        Spacer().frame(height: 32)
                        
                        Map()
                            .frame(height: 130)
                            .cornerRadius(12)
                        
                        Spacer().frame(height: 24)
                        
                      
                        if bookingViewModel.isLoading && bookingViewModel.bookings.isEmpty {
                            // 1. Show loader while the initial fetch is happening
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                        } else {
                            // 2. Check status once data is available
                            let existingBooking = bookingViewModel.bookings.first {
                                $0.fields.courseid == selectedCourse.id && $0.fields.userID == currentUserID
                            }
                            
                            if let booking = existingBooking {
                                
                                Button(action: {
                                    showDeleteConfirmation = true
                                }) {
                                    Text(bookingViewModel.isLoading ? "Processing..." : "Cancel Booking")
                                        .font(.headline)
                                        .foregroundColor(.red)
                                        .padding(.vertical, 12)
                                        .frame(maxWidth: .infinity)
                                }
                                .disabled(bookingViewModel.isLoading)
                                .background(Color.clear)
                                .alert("Cancel booking?", isPresented: $showDeleteConfirmation) {
                                    Button("Yes", role: .destructive) {
                                        Task {
                                          
                                            await bookingViewModel.deleteBooking(
                                                bookingID: booking.id,
//                                                courseID: selectedCourse.id
                                            )
                                        }
                                    }
                                    Button("No", role: .cancel) { }
                                } message: {
                                    Text("This action will remove your spot from the course.")
                                }
                            } else {
                                
                                ButtonView(
                                    label: "Book a space",
                                    action: {
                                        Task {
                                            await bookingViewModel.addBooking(courseID: selectedCourse.id, userID: currentUserID)
                                            if bookingViewModel.errorMessage == nil {
                                                withAnimation { showAlert = true }
                                            }
                                        }
                                    }
                                )
                                .disabled(bookingViewModel.isLoading)
                                .opacity(bookingViewModel.isLoading ? 0.5 : 1.0)
                            }
                        }
                        
                    
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.bottom, 30)
            }

            if showAlert {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation { showAlert = false }
                    }
                
                SuccessAlert(show: $showAlert)
                    .transition(.scale.combined(with: .opacity))
                    .zIndex(1)
            }
        }
        .navigationTitle(selectedCourse.fields.title)
        .navigationBarTitleDisplayMode(.inline)
        // ensures data loads before the user sees the final button state
        .task {
            await bookingViewModel.loadBooking()
        }
    }
}
