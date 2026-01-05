//
//  NetworkError.swift
//  HomBakery-team7-m
//
//  Created by Linda on 01/01/2026.
//


enum NetworkError: Error {
    case invalidURL
    case invalidResponseFromServer
    case invalidData
}
//
//  Errors.swift
//  HomBakery-team7-m
//
//  Created by nouransalah on 16/07/1447 AH.
//
import Foundation


enum LoginResult {
    case success(user: UserAndChef)
    case emailNotFound
    case wrongPassword
    
    
    
}


enum AppError: LocalizedError, Identifiable {
    case emailNotFound
    case wrongPassword
    case networkError
    case unknown

    var id: String { localizedDescription }

    var errorDescription: String? {
        switch self {
        case .emailNotFound:
            return "Email not found. Please check and try again."
        case .wrongPassword:
            return "Incorrect password."
        case .networkError:
            return "Network error. Please try again later."
        case .unknown:
            return "Something went wrong."
        }
    }
}
