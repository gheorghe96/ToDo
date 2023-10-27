//
//  LoginViewViewModel.swift
//  todo
//
//  Created by Gheorghe Curca on 27.10.2023.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    private let auth = Auth.auth()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var error: String = ""
    @Published var loading: Bool = true
    
    func signInWithEmail() {
        self.loading = true
        auth.signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                self.error = error.localizedDescription
            }
            self.loading = false
        }
    }
    
    func createWithEmail() {
        self.loading = true
        auth.createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                self.error = error.localizedDescription
            }
            self.loading = false
        }
    }
}
