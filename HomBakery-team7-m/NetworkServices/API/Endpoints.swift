//
//  Endpoints.swift
//  HomBakery-team7-m
//
//  Created by Linda on 01/01/2026.
//

enum Endpoint {
    case chef
    case user
    case course
    case courseId(id: Int)
    case booking
    case bookingId(id: Int)

    var path: String {
        switch self {
        case .chef: return "/chef"
        case .user: return "/user"
        case .course: return "/course"
        case .courseId(let id): return "/course/\(id)"
        case .booking: return "/booking"
        case .bookingId(let id): return "/booking/\(id)"

        }
    }
}
