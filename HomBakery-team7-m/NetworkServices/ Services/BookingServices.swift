//
//  BookingServices.swift
//  HomBakery-team7-m
//
//  Created by Linda on 01/01/2026.
//

import Foundation
import Combine

protocol BookingServicing {
    // Change this to return the array of Bookings
    func fetchBooking() async throws -> [Booking]
    
    func addBooking(by id: String) async throws -> Booking?
    func deleteBooking(by id: String) async throws -> DeleteBookingResponse?
}

final class BookingService: BookingServicing {

    private let networkManager: NetworkManaging

    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }

    let url = APIConstants.baseURL
        .appendingPathComponent(Endpoint.booking.path)
    
    // 1. Fetch all bookings
    func fetchBooking() async throws -> [Booking] { // Changed return type to [Booking] to match implementation
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // We decode the wrapper (BookingResponse) then return the records array
        let response: BookingResponse = try await networkManager.request(request)
        return response.records
    }
    
    // 2. Add booking for a specific course
    func addBooking(by courseId: String) async throws -> Booking? {
        // Create request to the BASE url (not appending ID for POST)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Construct the body. Airtable usually expects a "fields" dictionary inside a "records" array
        // or just a single "fields" object depending on your API setup.
        let body: [String: Any] = [
            "fields": [
                "courseid": courseId,
                "user_id": "recK8QGYcpM8667s9", // You should pass actual User ID here
                "status": "Pending"
            ]
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        return try await networkManager.request(request)
    }
    
    // 3. Delete booking
    func deleteBooking(by id: String) async throws -> DeleteBookingResponse? {
        // Appending the specific ID to delete that specific record
        let deleteURL = url.appendingPathComponent(id)

        var request = URLRequest(url: deleteURL)
        request.httpMethod = "DELETE"
        request.setValue(APIConstants.token, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return try await networkManager.request(request)
    }
}
