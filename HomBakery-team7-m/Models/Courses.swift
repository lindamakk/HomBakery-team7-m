//
//  Courses.swift
//  HomBakery-team7-m
//
//  Created by nouransalah on 09/07/1447 AH.
//

//Courses

import Foundation
import SwiftUI

struct ClassesResponse: Codable {
    let records: [Courses]
}



struct Courses: Codable, Identifiable, Hashable {
    let id: String
    let createdTime: String
    let fields: CoursesFields
}
////diffrent name between api and swift handle here
struct CoursesFields: Codable, Hashable {
    let title: String
    let level: Levels
    let locationName: String
    let locationLatitude: Double
    let locationLongitude: Double
    let chefID: String
    let startDate: TimeInterval
    let endDate: TimeInterval
    let description: String
    let imageURL: String


    enum CodingKeys: String, CodingKey {
        case title
        case level
        case locationName = "location_name"
        case locationLatitude = "location_latitude"
        case locationLongitude = "location_longitude"
        case chefID = "chef_id"
        case startDate = "start_date"
        case endDate = "end_date"
        case description
        case imageURL = "image_url"
    }
}

extension CoursesFields {
    var startDateFormatted: Date {
        Date(timeIntervalSince1970: startDate)
    }

    var endDateFormatted: Date {
        Date(timeIntervalSince1970: endDate)
    }

    var startDateString: String {
        let formatter = DateFormatter()
        // "d" = day, "MMM" = short month, "h:mm a" = 12h time with AM/PM
        formatter.dateFormat = "d MMM - h:mm a"
        formatter.locale = Locale(identifier: "en_US") // Ensures English month names
        return formatter.string(from: startDateFormatted)
    }
    var endDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM - h:mm a"
        formatter.locale = Locale(identifier: "en_US") // Ensures English month names
        return formatter.string(from: endDateFormatted)
    }
    
    private var startDateAsDate: Date {
        Date(timeIntervalSince1970: startDate)
    }
    // MARK: - Day (15)
    var startDay: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter.string(from: startDateAsDate)
    }

    // MARK: - Month (DEC)
    var startMonthShort: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        formatter.locale = Locale(identifier: "en_US") // ensures DEC, NOV, OCT
        return formatter.string(from: startDateAsDate).uppercased()
    }

    // MARK: - Time (4:00 PM)
    var startTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: startDateAsDate)
    }
}




//levellllllss

enum Levels: String, Codable, Hashable {
    case beginner
    case intermediate
    case advance

    var title: String {
        rawValue.capitalized
    }
    
    //background color
    var backColor: Color {
        switch self {
        case .beginner:
            return Color("brownColor")
        case .intermediate:
            return Color("creamColor")
        case .advance:
            return Color("AccentColor")
        }
    }
    //text color
    var textColor: Color {
        switch self {
        case .beginner:
            return Color.white
        case .intermediate:
            return Color("brownColor")
        case .advance:
            return Color.white
        }
    }

}//end of enum



