//
//  Datehelpers.swift
//  HomBakery-team7-m
//
//  Created by dina alswailem on 11/07/1447 AH.
//

import SwiftUI


// MARK: - Date helpers (from API timestamps)

 func formattedDate( timeInterval: TimeInterval) -> String {
    let date = Date(timeIntervalSince1970: timeInterval)
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM"
    return formatter.string(from: date)
}


 func formattedTime(start: TimeInterval, end: TimeInterval) -> String {
    let startDate = Date(timeIntervalSince1970: start)
    let endDate   = Date(timeIntervalSince1970: end)

    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"

    return "\(formatter.string(from: startDate)) – \(formatter.string(from: endDate))"
}

 func formattedDuration(start: TimeInterval, end: TimeInterval) -> String {
    let durationSeconds = max(0, end - start)
    let hours = Int(durationSeconds) / 3600
    let minutes = (Int(durationSeconds) % 3600) / 60

    if hours > 0 && minutes > 0 {
        return "\(hours)h \(minutes)m"
    } else if hours > 0 {
        return "\(hours)h"
    } else {
        return "\(minutes)m"
    }
}
