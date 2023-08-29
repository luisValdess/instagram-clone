//
//  LoginViewModel.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/29/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
