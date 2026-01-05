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
    
    let selectedCourse: Courses
    let chefName: String
    
   
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
                            chefName:
                        chefName,
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
                        
                        ButtonView(label: "Book a space", action: {
                            
//                            
//                            print("clicking book button")
//                            showAlert = true
//                            withAnimation {
//                            showAlert = true
//                            }
//                                print("clicking book button")
//                                
                                Task {
                                 await   bookingViewModel.addBooking(by: selectedCourse.id, by: "userID")
                                }
                        })
                    }
                    .padding(.horizontal, 16) // Apply padding to the text container only
                }
              
            }
            if showAlert {
                           
                            Color.black.opacity(0.4)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    withAnimation { showAlert = false }
                                }
                            
                            SuccessAlert(show: $showAlert)
                        }
        }
        .navigationTitle(selectedCourse.fields.title)
        .navigationBarTitleDisplayMode(.inline)
//        .task {
//                // triggers the fetch for the chef
//                await chefViewModel.loadChefById(by: selectedCourse.fields.chefID)
//            }
    }
}

