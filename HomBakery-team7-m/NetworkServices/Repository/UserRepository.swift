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
    private let currentUserKey = "currentUser"

    private init() {}
//i wiil not allow to create instanse just read arr
    @Published private(set) var usersSharedArr: [UserAndChef] = []
    //shared user id in this variable
    @Published private(set) var currentUser: UserAndChef?


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
//serch for email
        guard let user = user(email: email) else {
            print("❌ Email not found")
            return .emailNotFound
        }

        // 2️⃣ نتحقق من كلمة المرور
        if user.fields.password == password {
            //here save user id after i made sure user is loged in
            currentUser = user
            //when user log in save user object to disk
            saveCurrentUser(user)
            print("✅ Login success")
            return .success(user: user)
        } else {
            print("❌ Wrong password")
            return .wrongPassword
        }
    }
    
    func updateCurrentUser(name: String) async throws {

        guard let currentUser = currentUser else {
            print("❌ No current user!")
            throw NSError(domain: "No logged user", code: 401)
        }

//        let updatedFields = UserFields(
//            name: name,
//            email: currentUser.fields.email,
//            password: currentUser.fields.password
//        )
//
//        let updatedUser = UserAndChef(
//            id: currentUser.id,
//            fields: updatedFields
//        )

        let savedUser = try await service.updateUser(user: currentUser , newNameU: name)
print("after save user")
        // 🔄 Sync shared state
        self.currentUser = savedUser
        //when i update user name i need also update object that is saved on disk so it can be sync
        saveCurrentUser(savedUser)
        print("after save current user")
        print(savedUser)
        if let index = usersSharedArr.firstIndex(where: { $0.id == savedUser.id }) {
            usersSharedArr[index] = savedUser
        }
    }

//save user in json form on devise
    func saveCurrentUser(_ user: UserAndChef) {
        if let data = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(data, forKey: currentUserKey)
        }
    }
    //load user from disk in json
    func loadCurrentUser() {
        if let data = UserDefaults.standard.data(forKey: currentUserKey),
           let user = try? JSONDecoder().decode(UserAndChef.self, from: data) {
            currentUser = user
            print("hhhhhhhhhhhhhhhhhhhhhhh")
            print(user)
        }
    }



}


struct AuthManager {
    
    //key name used to save data in UserDefaults
    static let isLoggedInKey = "isLoggedIn"
//return bool
    static var isLoggedIn: Bool {
        //Getter to read UserDefaults and return t or f
        get { UserDefaults.standard.bool(forKey: isLoggedInKey) }
        //Setter save new value so App remembers login after restart
        set { UserDefaults.standard.set(newValue, forKey: isLoggedInKey) }
    }
}
