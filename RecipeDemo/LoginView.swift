//
//  LoginView.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 20/01/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var isShowingPassword = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text("Bienvenido")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Por favor, ingresa tu cuenta")
                    .font(.footnote)
                    .foregroundStyle(.gray)
                VStack(spacing: 12) {
                    HStack {
                        Image(systemName: "envelope")
                            .fontWeight(.semibold)
                        TextField("Email", text: $viewModel.email)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                    }
                    .modifier(TextViewModifier())
                    
                    HStack {
                        Image(systemName: "lock")
                            .fontWeight(.semibold)
                        
                        if isShowingPassword {
                            SecureField("Password", text: $viewModel.password)
                                    .font(.subheadline)
                                    .padding(12)
                                    .cornerRadius(12)
                        } else {
                            TextField("Password", text: $viewModel.password).font(.subheadline).padding(12).cornerRadius(12)
                        }
                        
                        Button{
                            //mostrar password
                            isShowingPassword.toggle()
                        } label: {
                            Image(systemName: isShowingPassword ? "eye" : "eye.slash")
                                .foregroundColor(.gray)
                        }
                    }
                    .modifier(TextViewModifier())
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Olvidaste password")
                                .foregroundStyle(.black)
                        })
                        
                    }
                    .padding(.trailing, 24)
                }
                
                // login Buttons
                VStack(spacing: 16) {
                    Button(action: {
                        Task{
                            try await viewModel.login()
                        }
                        
                    }, label: {
                        Text("Ingresar")
                            .modifier(RoundedColorButton(color: Color(.blue)))
                    })
                    
                    Text("o continúa con...")
                    
                    Button(action: {}, label: {
                        Text("Google")
                            .modifier(RoundedColorButton(color:Color(.orange)))
                    })
                    
                    NavigationLink {
                        RegistrationView()
                    } label: {
                        HStack{
                            
                            Text("No tienes una cuenta")
                            Text("Registrate")
                                .foregroundColor(.green)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.black)
                        .font(.footnote)
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
