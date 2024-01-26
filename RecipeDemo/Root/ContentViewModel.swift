//
//  ContentViewModel.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 26/01/2024.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth

class ContentViewModel: ObservableObject {
    // Recibir la sesión del usuario desde Auth Service
    @Published var userSession: FirebaseAuth.User?
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        setupSuscribers()
    }
    
    private func setupSuscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancelables)
    }
    
}
