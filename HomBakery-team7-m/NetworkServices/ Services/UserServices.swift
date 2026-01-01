//
//  UserServices.swift
//  HomBakery-team7-m
//
//  Created by Linda on 01/01/2026.
//

//
//  CourseServicing.swift
//  HomBakery-team7-m
//
//  Created by Linda on 01/01/2026.
//
import Foundation

//
//  ChefServices.swift
//  HomBakery-team7-m
//
//  Created by Linda on 01/01/2026.
//
import Foundation

protocol UserServicing {
    func fetchUsers() async throws -> [UserAndChef]
    func fetchUser(by id: String) async throws -> UserAndChef?
}

final class UserService: UserServicing {

    private let networkManager: NetworkManaging

    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }

    
    //fetch all chefs
    func fetchUsers() async throws -> [UserAndChef] {
        // Build the URL
        let url = APIConstants.baseURL
            .appendingPathComponent(Endpoint.user.path) // Replace with your actual endpoint path

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Call NetworkManager
        let response: UserAndChefResponse = try await networkManager.request(request)
        return response.records
    }
    //fetch chef by id
    func fetchUser(by id: String) async throws -> UserAndChef? {
        let url = APIConstants.baseURL
            .appendingPathComponent("user")
            .appendingPathComponent(id)

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let response: UserAndChefResponse = try await networkManager.request(request)
        return response.records.first
    }
}
