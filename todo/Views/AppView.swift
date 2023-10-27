//
//  ContentView.swift
//  todo
//
//  Created by Gheorghe Curca on 27.10.2023.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var auth = AuthenticationModule.shared
    
    
    var body: some View {
        if auth.user != nil, auth.userData != nil {
            HomeView()
        } else {
            LoginView()
        }
    }
}
