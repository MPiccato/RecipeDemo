//
//  ContentView.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 20/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    @StateObject var viewModel = ContentViewModel()
    @State private var isVstackVisible: Bool = true
    
    var body: some View {
        VStack {
            if isVstackVisible {
                VStack {
                    Image("recipe")
                        .resizable()
                        .frame(height: 400)
                    VStack {
                        Text("Empieza a cocinar")
                            .font(.title)
                            .fontWeight(.semibold)
                        Text("Únete a nuestra comunidad y \n disfruta de las mejores recetas")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button {
                        isPresented = true
                        UserDefaults.standard.set(true, forKey:"Onboarding")
                    } label: {
                        Text("¡Empecemos!")
                            .modifier(RoundedColorButton(color: Color(.green)))
                    }
                    Spacer()
                        .fullScreenCover(isPresented: $isPresented, content: {
                            LoginView()
                        })
                
                }} else {
                    Group {
                        if viewModel.userSession != nil {
                            RecipeTabView()
                        } else {
                            LoginView()
                        }
                    }
                }
        }
        .onAppear(perform: {
            if UserDefaults.standard.bool(forKey:"Onboarding") {
                isVstackVisible = false
            }
        })
        
    }
}

#Preview {
    ContentView()
}
