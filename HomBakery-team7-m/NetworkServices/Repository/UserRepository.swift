//
//  UserRepository.swift
//  HomBakery-team7-m
//
//  Created by nouransalah on 12/07/1447 AH.
//
import Foundation
import Combine
@MainActor
final class UsersRepository: ObservableObject {
//static for sharing to otherrr clases
    static let shared = UsersRepository()

    private init() {}
//i wiil not allow to create instanse just read arr
    @Published private(set) var usersSharedArr: [UserAndChef] = []

    private let service: UserServicing = UserService()
    private var hasFetched = false

    /// Fetch only once
    func loadUsersIfNeeded() async {
        //did we fetch before
        guard !hasFetched else { return }

        do {
            //save all user in variable
            let fetchedUsers = try await service.fetchUsers()
            //put object in arr
            self.usersSharedArr = fetchedUsers
            self.hasFetched = true
        } catch {
            print("❌ Failed to fetch users:", error)
        }
    }

    // Helper methods
    //return user object when i have id
    func user(by id: String) -> UserAndChef? {
        usersSharedArr.first { $0.id == id }
    }
    //return user object when i have email
    func user(email: String) -> UserAndChef? {
        usersSharedArr.first { $0.fields.email == email }
    }
//    func user(password: String) -> UserAndChef? {
//        usersSharedArr.first { $0.fields.password == password }
//    }
    
    func login(email: String, password: String) -> LoginResult {

        // 1️⃣ نبحث عن المستخدم بالإيميل
        guard let user = user(email: email) else {
            print("❌ Email not found")
            return .emailNotFound
        }

        // 2️⃣ نتحقق من كلمة المرور
        if user.fields.password == password {
            print("✅ Login success")
            return .success(user: user)
        } else {
            print("❌ Wrong password")
            return .wrongPassword
        }
    }
}
