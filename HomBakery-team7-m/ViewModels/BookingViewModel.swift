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
