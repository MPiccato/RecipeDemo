//
//  TextViewModifier.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 20/01/2024.
//

import SwiftUI

struct TextViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color(.systemGray3), lineWidth: 1)
                    .padding(.horizontal, -12)
            )
            .padding(.horizontal,24)
    }
}
