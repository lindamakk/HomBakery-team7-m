//
//  CoursesLoader.swift
//  HomBakery-team7-m
//
//  Created by dina alswailem on 11/07/1447 AH.
//

import Foundation
import Combine

class CoursesLoader: ObservableObject {

    @Published var courses: [Courses] = []

    func load() {
        let url = URL(string: "")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(
            "",
            forHTTPHeaderField: "Authorization"
        )

        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data else { return }

            let decoded = try? JSONDecoder().decode(ClassesResponse.self, from: data)

            DispatchQueue.main.async {
                self.courses = decoded?.records ?? []
            }
        }.resume()
    }
}
