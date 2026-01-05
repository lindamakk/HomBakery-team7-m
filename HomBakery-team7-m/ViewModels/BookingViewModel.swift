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

        func isCourseBooked(courseID: String, userID: String) -> Bool {
            
            
            
        return    bookings.contains { $0.fields.courseid == courseID && $0.fields.userID == userID }
        }

        func addBooking(courseID: String, userID: String) async {
            isLoading = true
            do {
                let newBooking = try await bookingService.createBooking(by: courseID, by: userID)
                // INSTEAD of reloading the whole list, just append the new one!
                self.bookings.append(newBooking!)
            } catch { /* handle error */ }
            isLoading = false
        }

    func deleteBooking(bookingID: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
        
            try await bookingService.deleteBooking(by: bookingID)
            
            self.bookings.removeAll { $0.id == bookingID }
            
            
        } catch {
            self.errorMessage = error.localizedDescription
            
        }
        
        isLoading = false
    }
//
    
}
