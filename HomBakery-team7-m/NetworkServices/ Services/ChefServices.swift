//
//  ChefServices.swift
//  HomBakery-team7-m
//
//  Created by Linda on 01/01/2026.
//
import Foundation

protocol ChefServicing {
    func fetchChefs() async throws -> [UserAndChef]
    func fetchChef(by id: String) async throws -> UserAndChef?
}

final class ChefService: ChefServicing {

    private let networkManager: NetworkManaging

    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }

    let url = APIConstants.baseURL
        .appendingPathComponent(Endpoint.chef.path)
    //fetch all chefs
    func fetchChefs() async throws -> [UserAndChef] {
        // Build the URL
   

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Call NetworkManager
        let response: UserAndChefResponse = try await networkManager.request(request)
        return response.records
    }
    //fetch chef by id
    func fetchChef(by id: String) async throws -> UserAndChef? {
        let url = url
            .appendingPathComponent(id)

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let response: UserAndChefResponse = try await networkManager.request(request)
        return response.records.first
    }
}
