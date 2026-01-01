//
//  SearchCoursesViewModel.swift
//  HomBakery-team7-m
//
//  Created by aisha alh on 12/07/1447 AH.
//
import Foundation
import Combine

class SearchCoursesViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var results: [Courses] = []   
    private var cancellables = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] value in
                self?.search(by: value)
            }
            .store(in: &cancellables)
    }
    func search(by name: String) {
        guard !name.isEmpty else {
            DispatchQueue.main.async {
                self.results=[]
            }
            return
        }
    
        let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let url = URL(string: "https://api.airtable.com/v0/appXMW3ZsAddTpClm/course\(encodedName)")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(
            "Bearer YOUR_API_KEY",
            forHTTPHeaderField: "Authorization"
        )

        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data else { return }

            do {
                let decoded = try JSONDecoder().decode(ClassesResponse.self, from: data)

                DispatchQueue.main.async {
                    self.results = decoded.records
                }
            } catch {
                print("Search error:", error)
            }
        }.resume()
    }
}
