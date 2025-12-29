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



struct Courses: Codable, Identifiable {
    let id: String
    let createdTime: String
    let fields: CoursesFields
}
////diffrent name between api and swift handle here
struct CoursesFields: Codable {
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




//levellllllss

enum Levels: String, Codable {
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
