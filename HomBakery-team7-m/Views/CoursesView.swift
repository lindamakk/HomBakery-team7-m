//
//  CoursesView.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI
import SwiftData

struct CoursesView: View {

    @StateObject private var loader = CoursesLoader()

    var body: some View {
        NavigationStack {
            VStack {

                // 🔍 Search (UI فقط)
                SearchTextfield(text: .constant("restaurent"))
                    .padding()

                // 📦 Courses from API
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(loader.courses) { course in
                            CourseCard(
                                course: mapToCardModel(apiCourse: course)
                            )
                        }
                    }
                    .padding()
                }
                .navigationTitle("Courses")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            loader.load()
        }
    }

}

#Preview {
    CoursesView()
}
