//
//  TestSearchView.swift
//  HomBakery-team7-m
//
//  Created by aisha alh on 14/07/1447 AH.
//


import SwiftUI

struct TestSearchView: View {

    @StateObject private var viewModel = SearchCoursesViewModel()

    var body: some View {
        VStack(spacing: 16) {

            TextField("ابحث عن دورة", text: $viewModel.searchText)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)

            List {
                ForEach(viewModel.results) { course in
                    Text(course.fields.title)
                }
            }
        }
        .onAppear {
            print(" TestSearchView appeared")
        }
    }
}
