//
//  RegistrationView.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 21/01/2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    
    @Environment(\.dismiss) private var dismmiss
    var isPasswordValidLength: Bool {
        return password.count >= 6
    }
    
    var isPasswordWithNumber: Bool {
        return password.contains(where: { $0.isNumber})
    }
    
    var isPasswordWithUpperCase: Bool {
        return password.contains(where: {$0.isUppercase})
    }
    var isPasswordWithLowerCase: Bool {
        return password.contains(where: {$0.isLowercase})
    }
    
    var isPasswordValid: Bool {
        return isPasswordWithNumber &&
        isPasswordValidLength &&
        isPasswordWithLowerCase &&
        isPasswordWithUpperCase
    }
    
    @State private var isShowingPassword: Bool = false
    
    
    
    var body: some View {
        VStack(spacing: 16) {
            Text("¡Bienvenido!")
                .font(.title2)
                .fontWeight(.semibold)
            Text("Por favor, ingresa tu cuenta")
                .font(.footnote)
                .foregroundStyle(.gray)
            VStack(spacing: 12) {
                HStack {
                    Image(systemName: "envelope")
                        .fontWeight(.semibold)
                    TextField("Email", text: $email)
                        .font(.subheadline)
                        .padding(12)
                        .cornerRadius(12)
                }
                .modifier(TextViewModifier())
                
                HStack {
                    Image(systemName: "envelope")
                        .fontWeight(.semibold)
                    
                    if isShowingPassword {
                        TextField("Password", text: $password)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                        
                    } else {
                        
                        SecureField("Password", text: $password)
                            .font(.subheadline)
                            .padding(12)
                            .cornerRadius(12)
                    }
                    
                    Button{
                        isShowingPassword.toggle()
                    } label: {
                        Image(systemName: isShowingPassword ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                    }
                }
                .modifier(TextViewModifier())
              
            }
            
            VStack(spacing: 16) {
                Text("Tu contraseña debería contener:")
                VStack {
                    HStack {
                        Image(systemName: isPasswordValidLength ?  "checkmark.circle.fill" :
                            "checkmark.circle"
                        )
                        .foregroundColor( isPasswordValidLength ? .green :
                            .gray
                        )
                        Text("Al menos 6 caracteres")
                        
                    }
                    HStack {
                        Image(systemName: isPasswordWithNumber ?  "checkmark.circle.fill" :
                            "checkmark.circle"
                        )
                        .foregroundColor( isPasswordWithNumber ? .green :
                            .gray
                        )
                        Text("Al menos un número")
                        
                    }
                    HStack {
                        Image(systemName: isPasswordWithUpperCase ?  "checkmark.circle.fill" :
                            "checkmark.circle"
                        )
                        .foregroundColor( isPasswordWithUpperCase ? .green :
                            .gray
                        )
                        Text("Al menos una letra mayúscula")
                        
                    }
                    HStack {
                        Image(systemName: isPasswordWithLowerCase ?  "checkmark.circle.fill" :
                            "checkmark.circle"
                        )
                        .foregroundColor( isPasswordWithLowerCase ? .green :
                            .gray
                        )
                        Text("Al menos una letra minúscula")
                        
                    }
                    
                }
                .font(.footnote)
                
            }
            
            
            
            // login Buttons
            VStack(spacing: 16) {
                Button(action: {}, label: {
                    Text("Registrarse")
                        .modifier(RoundedColorButton(color: Color(.blue)))
                })
                .opacity(isPasswordValid ? 1 : 0.5)
                .disabled(!isPasswordValid)
                
                Button(action: {
                    // Regresar al Login
                    dismmiss()
                }, label: {
                    HStack {
                        Text("Ya tengo una cuenta")
                        Text("Ingresar")
                            .foregroundColor(.green)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                    
                })
                    
                    
                }
                
            }
            .padding(.vertical, 50)
        }
    }


#Preview {
    RegistrationView()
}
