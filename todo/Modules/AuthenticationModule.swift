//
//  AuthenticationModule.swift
//  todo
//
//  Created by Gheorghe Curca on 27.10.2023.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

class AuthenticationModule: ObservableObject {
    static let shared = AuthenticationModule()
    
    private let auth = Auth.auth()
    private let db = Firestore.firestore()
    
    @Published var user: User? = nil
    @Published var userData: UserData? = nil
    
    private var authListener: AuthStateDidChangeListenerHandle? = nil
    private var dataListener: ListenerRegistration?
    
    init() {
        self.authListener = auth.addStateDidChangeListener { auth, user in
            self.user = user
            
            if (user != nil) {
                self.dataListener = self.db.collection("users").document(user!.uid).addSnapshotListener { snapshot, error in
                    if let error = error {
                        print("Get user data error: ", error)
                        return
                    }
                    
                    if (snapshot != nil) {
                        if let data = try? snapshot?.data(as: UserData.self) {
                            self.userData = data
                        }
                    }
                }
            }
        }
    }
    
    deinit {
        if (authListener != nil) {
            auth.removeStateDidChangeListener(authListener!)
        }
        if (dataListener != nil) {
            dataListener?.remove()
            dataListener = nil
        }
    }
}
