//
//  BookingViewModel.swift
//  HomBakery-team7-m
//
//  Created by Linda on 04/01/2026.
//


import Foundation
import Combine
@MainActor
final class BookingViewModel: ObservableObject {

    @Published var bookings: [Booking] = []
    @Published var bookedCourses: [Courses] = []
    @Published var useBookings: [Booking] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private let bookingService: BookingServicing
    
 
    
    init(bookingService: BookingServicing = BookingService()) {
        self.bookingService = bookingService
    }
//load all bookings
    func loadBooking() async {
        
        isLoading = true
        errorMessage = nil

        do {
            
            bookings = try await bookingService.fetchBooking()
            
            
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
    
    
    func getUserBooking(
        userID: String,
        allCourses: [Courses]
    ) async {

        await loadBooking()

        // 1️⃣ فلترة bookings حسب اليوزر
        let userBookings = bookings.filter {
            $0.fields.userID == userID
        }

        print("🎟 User bookings:", userBookings.count)

        // 2️⃣ استخراج course IDs
        let courseIDs = userBookings.compactMap { $0.fields.courseid }

        print("🆔 Course IDs:", courseIDs)

        // 3️⃣ مطابقة مع courses
        bookedCourses = allCourses.filter {
            courseIDs.contains($0.id)
        }

        print("📚 Booked courses:", bookedCourses.count)
    }

//
//    func loadCoursesById(by id: String) async {
//        isLoading = true
//        errorMessage = nil
//
//        do {
//           try await bookingService.addBooking(by: id)
//        } catch {
//            errorMessage = error.localizedDescription
//        }
//
//        isLoading = false
//    }
//    
    
}
    
