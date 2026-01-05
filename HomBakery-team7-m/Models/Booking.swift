//
//  Booking.swift
//  HomBakery-team7-m
//
//  Created by nouransalah on 09/07/1447 AH.
//


import Foundation

// MARK: - Welcome
struct BookingResponse: Codable {
    let records: [Booking]
}

// MARK: - Record
struct Booking: Codable {
    let id, createdTime: String
    let fields: BookingFields
}

// MARK: - Fields
struct BookingFields: Codable {
    let courseid: String?
    let userID: String
    let   status: String

    enum CodingKeys: String, CodingKey {
        case courseid
        case userID = "user_id"
        case status
    }
}


struct DeleteBookingResponse: Codable {
    let deleted, id: String
}
