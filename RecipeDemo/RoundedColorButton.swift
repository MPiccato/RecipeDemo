//
//  RoundedButton.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 20/01/2024.
//

import SwiftUI

struct RoundedColorButton: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(.horizontal)
            .background(Color(.green))
            .cornerRadius(24)
            .padding(.horizontal,24)
    }
}
