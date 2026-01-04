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
    @Published var errorMessage: String?
    @Published var isSuccess = false

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
    
    
    func toggleEditing() {
        isEditing.toggle()
    }


    func saveChanges() async {
       // guard isEditing else { return }
        isSaving = true
        print("Saving name:", name)
        do {
            //for debug
            print("Saving name:", name)
            try await UsersRepository.shared.updateCurrentUser(name: name)
            errorMessage = nil
            print("✅ name updated")
        } catch {
            print("❌ Save failed:", error)
            errorMessage = "Failed to save"
        }
        isSaving = false
        isEditing = false
    }
}
