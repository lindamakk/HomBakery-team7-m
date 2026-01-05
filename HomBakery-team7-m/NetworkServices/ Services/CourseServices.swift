//
//  CourseServicing.swift
//  HomBakery-team7-m
//
//  Created by Linda on 01/01/2026.
//
import Foundation

protocol CourseServicing {
    func fetchCourses() async throws -> [Courses]
    func fetchCourseByID(by id: String) async throws -> Courses?
}

final class CourseService: CourseServicing {

    private let networkManager: NetworkManaging

    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    let url = APIConstants.baseURL
        .appendingPathComponent(Endpoint.course.path)
//fetcha all courses
    func fetchCourses() async throws -> [Courses] {

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let response: ClassesResponse = try await networkManager.request(request)
        return response.records
    }
    
    
    //fetch course by id
    func fetchCourseByID(by id: String) async throws -> Courses? {
        let url = url
            .appendingPathComponent(id)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let response: Courses = try await networkManager.request(request)
        
        
        return response
    }
    
}
