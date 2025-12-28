//
//  Untitled.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//
import SwiftUI
import SwiftData

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppBackground")
                    .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {

                        // Profile section
                        ProfileCard()
                        

                        
                        Divider()
                        
                        // Booked courses title
                        Text("Booked courses")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.top, 4)

                        // Empty state (centered look)
                        NoBookedCourses()
                            .frame(maxWidth: .infinity)
                            .padding(.top, 24)

                        Spacer(minLength: 80)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
}
