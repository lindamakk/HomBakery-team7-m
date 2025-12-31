//
//  fetch.swift
//  HomBakery-team7-m
//
//  Created by nouransalah on 09/07/1447 AH.
//
import Foundation
class CourseService {
   // static let shared = CourseService()
    

    
    func fetchCourses() async throws -> [Courses] {
        let endPoint = ""
        guard let url = URL(string: endPoint) else { throw backeryError.invalidURL }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Add Airtable API key (replace YOUR_API_KEY)
        request.setValue("", forHTTPHeaderField: "Authorization")
        
        // Optional: set JSON content type
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Make the request
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw backeryError.invalidResponseFromServer
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ClassesResponse.self, from: data).records
        } catch {
            throw backeryError.invalidData
        }
    }
//func
    


}


enum backeryError: Error {
    case invalidURL
    case invalidResponseFromServer
    case invalidData

    
}//enum
