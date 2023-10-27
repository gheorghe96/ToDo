//
//  UserData.swift
//  todo
//
//  Created by Gheorghe Curca on 27.10.2023.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

class UserData: Codable {
    @DocumentID var id: String?
    var email: String
    
    init(id: String? = nil, email: String) {
        self.id = id
        self.email = email
    }
}
