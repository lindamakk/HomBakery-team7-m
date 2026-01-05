//
//  EditProfileViewModel.swift
//  HomBakery-team7-m
//
//  Created by nouransalah on 14/07/1447 AH.
//
import Combine
import Foundation
@MainActor
final class EditProfileViewModel: ObservableObject {
    @Published var isEditing: Bool = false
    @Published var isSaving: Bool = false
    @Published var name: String = ""
    @Published var error: AppError?
    @Published var showSuccess = false

//    func saveChanges() async {
//        do {            print("done change namemmmmmmmmmmmmm")
//            try await UsersRepository.shared.updateCurrentUser(name: name)
//
//        isSuccess = true
//        errorMessage = nil
//     
//        } catch {
//            print("in catch")
//            errorMessage = "Failed to update name"
//        }
//    }
    
    //load user name so it can apper on screen
    func loadUser() {
        guard let user = UsersRepository.shared.currentUser else {
            print("❌ No current user")
            return
        }

        name = user.fields.name ?? ""   // ⭐ populate text field
        print("👤 Loaded user name:", name)
    }
    
    func toggleEditing() {
        isEditing.toggle()
    }


    func saveChanges() async {
       // prevent empty name
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = .unknown
            return
        }
        
        isSaving = true
        print("Saving name:", name)
        do {
            //for debug
            print("Saving name:", name)
            try await UsersRepository.shared.updateCurrentUser(name: name)
            showSuccess = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showSuccess = false
            }
            error = nil
            print("✅ name updated")
        } catch {
            print("❌ Save failed:", error)
            self.error = .networkError


            //errorMessage = "Failed to save"
        }
        isSaving = false
        isEditing = false
    }
}
