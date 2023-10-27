//
//  LoginView.swift
//  todo
//
//  Created by Gheorghe Curca on 27.10.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack {
                TextField(
                    "Email",
                    text: $viewModel.email
                )
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.top, 20)
                .keyboardType(.emailAddress)
                
                Divider()
                
                SecureField(
                    "Password",
                    text: $viewModel.password
                )
                .padding(.top, 20)
                
                Divider()
            }
            
            Spacer()
            
            Button(
                action: {
                    if !viewModel.loading {
                        viewModel.signInWithEmail()
                    }
                },
                label: {
                    if (viewModel.loading) {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .tint(.white)
                    } else {
                        Text("Login")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            )
        }
        .padding(30)
    }
}
