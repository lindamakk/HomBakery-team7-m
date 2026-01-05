////
////  fetch.swift
////  HomBakery-team7-m
////
////  Created by nouransalah on 09/07/1447 AH.
////

import Foundation
import Combine
@MainActor
final class CoursesViewModel: ObservableObject {

    @Published var courses: [Courses] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let courseService: CourseServicing

    init(courseService: CourseServicing = CourseService()) {
        self.courseService = courseService
    }

    func loadCourses() async {
        isLoading = true
        errorMessage = nil

        do {
            courses = try await courseService.fetchCourses()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
