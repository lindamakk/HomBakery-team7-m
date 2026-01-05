//
//  SearchCoursesViewModel.swift
//  HomBakery-team7-m
//
//  Created by aisha alh on 12/07/1447 AH.
//
import Foundation
import Combine

class SearchCoursesViewModel: ObservableObject {

    // MARK: - Input
    @Published var searchText: String = ""

    // MARK: - Output
    @Published private(set) var results: [Courses] = []
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?

    private let courseService: CourseService
    // MARK: - Private
    private var allCourses: [Courses] = []
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init
    init(courseService: CourseService = CourseService()) {
        self.courseService = courseService
        isLoading = true
        errorMessage = nil
        setupSearch()
        fetchCourses() // Fetch courses when view model is initialized
    }

    // MARK: - Search Logic
    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.filterCourses(with: text)
            }
            .store(in: &cancellables)
    }

    private func filterCourses(with text: String) {
        guard !text.isEmpty else {
            results = allCourses
            return
        }

        results = allCourses.filter {
            $0.fields.title.localizedCaseInsensitiveContains(text)
        }
    }

    // MARK: - Fetch Courses
    func fetchCourses() {
        isLoading = true
        errorMessage = nil

        Task {
            do {
                let courses = try await courseService.fetchCourses()
                allCourses = courses // Populate the allCourses array
                results = courses // Set initial results
            } catch {
                errorMessage = error.localizedDescription
            }

            isLoading = false
        }
    }
}
