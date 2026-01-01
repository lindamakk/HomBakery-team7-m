//
//  ChefAndUser.swift
//  HomBakery-team7-m
//
//  Created by nouransalah on 09/07/1447 AH.
//

import Foundation

struct UserAndChefResponse: Codable {
    let records: [UserAndChef]
}
// MARK: - UserAndChef
struct UserAndChef: Codable {
    let id: String
    let createdTime: String
    let fields: UserAndChefFields
}

// MARK: - UserAndChefFields
struct UserAndChefFields: Codable {
    let name, email, password: String
}
