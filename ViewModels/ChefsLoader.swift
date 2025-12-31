//
//  ChefsLoader.swift
//  HomBakery-team7-m
//
//  Created by dina alswailem on 11/07/1447 AH.
//

import SwiftUI
import Combine

class ChefsLoader: ObservableObject {

    // GET /chef
    @Published var chefs: [UserAndChef] = []

    // GET /chef/:id
    @Published var selectedChef: UserAndChef?
    
    //loadChefs
    func loadChefs() {
        let url = URL(string: "")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(
            "",
            forHTTPHeaderField: "Authorization"
        )

        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data else { return }

            let decoded = try? JSONDecoder().decode([String: [UserAndChef]].self, from: data)

            DispatchQueue.main.async {
                self.chefs = decoded?["records"] ?? []
            }
        }.resume()
    }

    
    //loadChefById
    func loadChefById(_ id: String) {
        let urlString =
        ""

        let url = URL(string: urlString)!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(
            "",
            forHTTPHeaderField: "Authorization"
        )

        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data else { return }

            let decoded = try? JSONDecoder().decode([String: [UserAndChef]].self, from: data)

            DispatchQueue.main.async {
                self.selectedChef = decoded?["records"]?.first
            }
        }.resume()
    }
}
