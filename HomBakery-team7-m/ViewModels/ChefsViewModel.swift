//
//  ChefsLoader.swift
//  HomBakery-team7-m
//
//  Created by dina alswailem on 11/07/1447 AH.
//
import Foundation
import Combine

@MainActor
final class ChefsViewModel: ObservableObject {

    @Published var chefs: [UserAndChef] = []
    @Published var selectedChef: UserAndChef?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let chefService: ChefServicing

    init(chefService: ChefServicing = ChefService()) {
        self.chefService = chefService
    }

    func loadChefs() async {
        isLoading = true
        errorMessage = nil

        do {
            chefs = try await chefService.fetchChefs()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    func loadChef(by id: String) async {
        isLoading = true
        errorMessage = nil

        do {
            selectedChef = try await chefService.fetchChef(by: id)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}

