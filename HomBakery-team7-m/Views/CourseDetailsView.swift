//
//  CourseDetailsView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI

struct CourseDetailsView: View {

    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()

            VStack(spacing: 20) {

                Image("babka")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 240)
                    .clipped()

                Text("Babka dough")
                    .font(.title)
                    .fontWeight(.bold)

                Text("Learn how to bake delicious babka dough with professional chefs.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()

                Button("Book course") {
                    // booking later
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.brown)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Babka dough")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    CourseDetailsView()
}