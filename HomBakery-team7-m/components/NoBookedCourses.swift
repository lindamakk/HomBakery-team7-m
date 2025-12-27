//
//  NoBookedCourses.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//
import SwiftUI
struct NoBookedCourses: View {
    var body: some View {
        VStack(spacing: 15){
            Image("rollingPin")
                .resizable()
                .scaledToFit()
                .frame(width: 213, height: 43)

            Text("You don’t have any booked courses")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color("greyColor"))
        }//v
        .frame(width: .infinity)
    }//view
}//body
#Preview {
    
    NoBookedCourses()
}
