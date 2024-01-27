//
//  AuthService.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 23/01/2024.
//

import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func createUser(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("Usuario creado: \(result.user.uid)")
        } catch {
            
            print("Debug error: \(error.localizedDescription)")
            
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}

