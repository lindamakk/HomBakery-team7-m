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
//this class for
protocol UserServicing {
    func fetchUsers() async throws -> [UserAndChef]
    func fetchUser(by id: String) async throws -> UserAndChef?
    func updateUser(user: UserAndChef , newNameU: String) async throws -> UserAndChef

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
    func updateUser(user: UserAndChef, newNameU: String) async throws -> UserAndChef {
        let url = APIConstants.baseURL
            .appendingPathComponent("user")
            .appendingPathComponent(user.id)

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "fields": [
                "name": newNameU,
                "email": user.fields.email,
                "password": user.fields.password
            ]
        ]
        
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        print("📤 Sending update request for user:", user.id)

        do {
            let updatedUser: UserAndChef = try await networkManager.request(request)
            print("✅ Update request succeeded:", updatedUser.fields.name)
            return updatedUser
        } catch {
            print("❌ Update request failed:", error)
            throw error
        }
    }

//    //give it object
//    func updateUser(user: UserAndChef , newNameU: String) async throws -> UserAndChef {
//
//        let url = APIConstants.baseURL
//            .appendingPathComponent("user")
//            .appendingPathComponent(user.id)
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "PUT"
//        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let body: [String: Any] = [
//            "fields": [
//                "name": newNameU,
//                "email": user.fields.email,
//                "password": user.fields.password
//            ]
//        ]
//
//        print("before sening the requeast")
//        request.httpBody = try JSONSerialization.data(withJSONObject: body)
////        let response: UserAndChef = try await networkManager.request(request)
//
//        let _: UserAndChef = try await networkManager.request(request)
//        print("aft sening the requeast")
//
//
//        //let updatedUser: UserAndChef = try await networkManager.request(request)
//
//        let updatedUser: UserAndChef = try await networkManager.request(request)
//        print("Inside update user")
//        print(updatedUser)
//        return updatedUser
//
//
//
//        //guard
//          //  let updatedUser = response.self
//        //else {
//         //   throw URLError(.badServerResponse)
//       // }
//
//        //return updatedUser
//    }


}//class service
