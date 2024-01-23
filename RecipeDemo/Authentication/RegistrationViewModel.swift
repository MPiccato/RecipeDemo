//
//  RegistrationViewModel.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 23/01/2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password)
    }
}
