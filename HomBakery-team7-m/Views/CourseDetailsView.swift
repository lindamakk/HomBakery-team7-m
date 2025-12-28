//
//  CourseDetailsView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI
import MapKit

struct CourseDetailsView: View {
    
    var courseName: String = "Babka dough"
    var body: some View {
        ZStack {
            Color("AppBackground").ignoresSafeArea()

            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    AsyncImage(url: URL(string: "https://picsum.photos/200/300")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 275)
                    .frame(maxWidth: .infinity)
                    .clipped()

                    VStack(alignment: .leading) {
                        Spacer().frame(height: 24)
                        
                        Text("About the course:")
                            .bold()
                        
                        Spacer().frame(height: 10)
                        
                        Text("Needless to say, you will learn new techniques...")
                            .font(.subheadline)

                        Spacer().frame(height: 24)
                        Divider()
                        Spacer().frame(height: 24)
                        
                        CourseDetailsTable()
                        
                        Spacer().frame(height: 32)
                        
                        Map()
                            .frame(height: 130)
                            .cornerRadius(12)
                        
                        Spacer().frame(height: 24)
                        
                        ButtonView(label: "Book a space", action: {})
                    }
                    .padding(.horizontal, 16) // Apply padding to the text container only
                }
            }
        }
        .navigationTitle(courseName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    CourseDetailsView()
}
