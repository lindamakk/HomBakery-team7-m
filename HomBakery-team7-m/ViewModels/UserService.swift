//
//  UserService.swift
//  HomBakery-team7-m
//
//  Created by nouransalah on 12/07/1447 AH.
//


import Foundation
import SwiftUI
class UserService {
    
    func fetchUsers() async throws -> [UserAndChef] {
        let endPoint = ""
        guard let url = URL(string: endPoint) else { throw userError.invalidURL }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Add Airtable API key (replace YOUR_API_KEY)
        request.setValue("", forHTTPHeaderField: "Authorization")
        
        // Optional: set JSON content type
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Make the request
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw userError.invalidResponseFromServer
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(UserAndChefResponse.self, from: data).records
            
        } catch {
            throw userError.invalidData
        }
    }
//func
    enum userError: Error {
        case invalidURL
        case invalidResponseFromServer
        case invalidData

        
    }//enum

}

struct TestUsersView: View {
    let service = UserService()

    var body: some View {
        Text("Check Console")
            .task {
                do {
                    let users = try await service.fetchUsers()
                    print("Users count:", users.count)

                    for user in users {
                        print(user)
                    }

                } catch {
                    print("Error:", error)
                }
            }
    }
}
#Preview {
    TestUsersView()
}
