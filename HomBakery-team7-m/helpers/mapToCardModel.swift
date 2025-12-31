//
//  mapToCardModel.swift
//  HomBakery-team7-m
//
//  Created by dina alswailem on 11/07/1447 AH.
//

//
//  HomBakery-team7-m
//
//  Created by dina alswailem on 11/07/1447 AH.
//

//import SwiftData

// MARK: - Mapping API → UI Model

 func mapToCardModel( apiCourse: Courses) -> CourseCardModel {
    CourseCardModel(
        id: apiCourse.id.hashValue,
        title: apiCourse.fields.title,
        description: apiCourse.fields.description,
        duration: formattedDuration(
            start: apiCourse.fields.startDate,
            end: apiCourse.fields.endDate
        ),
        startDate: "\(formattedDate(timeInterval: apiCourse.fields.startDate)) • \(formattedTime(start: apiCourse.fields.startDate, end: apiCourse.fields.endDate))",
        imageName: "fortest", // مؤقت
        level: apiCourse.fields.level
    )
}
