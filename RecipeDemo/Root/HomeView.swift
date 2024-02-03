//
//  HomeView.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 03/02/2024.
//

import SwiftUI

enum CategoryFood: String, CaseIterable {
    case All
    case Food
    case Drink
    case Snack
    case Desert
}

struct HomeView: View {
    @State private var recipeToSearch: String = ""
    @State private var selectedCategory: CategoryFood = .All
    
    let data = (1...20).map {"Item \($0)"}
    var gridItemLayout = [GridItem(.flexible()),GridItem(.flexible()) ]
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Categoria")
                            .font(.title)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(CategoryFood.allCases, id: \.self) { category in
                                    Text(category.rawValue)
                                        .frame(width: 70)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(selectedCategory == category ? .white : .black)
                                        .padding()
                                        .background(selectedCategory == category ? .black : .green)
                                        .cornerRadius(24)
                                        .onTapGesture {
                                            selectedCategory = category
                                        }
                                }
                            }
                        }
                    }
                    .padding()
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 6)
                        .foregroundColor(Color(.systemGray6))
                    
                    Spacer()
                    
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout) {
                            ForEach(MockData.recipes, id: \.dishName) { item in
                                    RecipeCellView(recipe: item)
                            }
                        }
                        .padding()
                    }
                }.searchable(text:$recipeToSearch)
            }
        }
    }
}

#Preview {
    HomeView()
}
