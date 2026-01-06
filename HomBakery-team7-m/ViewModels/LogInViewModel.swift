////
////  UserService.swift
////  HomBakery-team7-m
////
////  Created by nouransalah on 12/07/1447 AH.
////
//
//
import Foundation
import SwiftUI
import Combine
@MainActor
final class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var error: AppError?

    func login() async -> Bool {
        let result = UsersRepository.shared.login(
            email: email,
            password: password
        )

        switch result {
        case .success(let user):
            print("Welcome \(user.fields.name)")
            error = nil
            return true  //  success

        case .emailNotFound:
            error = .emailNotFound
            return false

        case .wrongPassword:
            error = .wrongPassword
            return false
        }
    }
}

