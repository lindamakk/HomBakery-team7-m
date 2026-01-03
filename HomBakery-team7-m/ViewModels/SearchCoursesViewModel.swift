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

    // MARK: - Private
    private var allCourses: [Courses] = []
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init
    init() {
        setupSearch()
        fetchCourses()
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

    // MARK: - Fetch
    private func fetchCourses() {
        isLoading = true
        errorMessage = nil

        let url = APIConstants.baseURL.appendingPathComponent("course")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { [weak self] data, response, _ in
            DispatchQueue.main.async {
                self?.isLoading = false
            }

            guard let data else {
                DispatchQueue.main.async {
                    self?.errorMessage = "No data received"
                }
                return
            }

            do {
                let decoded = try JSONDecoder().decode(ClassesResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.allCourses = decoded.records
                    self?.results = decoded.records
                }
            } catch {
                DispatchQueue.main.async {
                    self?.errorMessage = "Failed to load courses"
                }
                print("Decoding error:", error)
            }
        }.resume()
    }
}
