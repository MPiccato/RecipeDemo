//
//  ProfileView.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 27/01/2024.
//

import SwiftUI

enum ProfileFilter: Int, CaseIterable, Identifiable {
    case recipes
    case liked
    
    var title: String {
        switch self {
        case .recipes:
            return "Recetas"
        case .liked:
            return "Me Gusta"
            
        }
        
    }
    
    var id: Int { return self.rawValue}
}

struct ProfileView: View {
    @State private var selectedFilter: ProfileFilter = .recipes
    @Namespace var animation
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("martin")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    Text("Martin Piccato")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.gray)
                }
                // Stats
                HStack(spacing: 36) {
                    VStack {
                        Text("32")
                            .fontWeight(.semibold)
                        Text("Recetas")
                            .font(.footnote)
                    }
                    VStack {
                        Text("780")
                            .fontWeight(.semibold)
                        Text("Seguidores")
                            .font(.footnote)
                    }
                    VStack {
                        Text("1.300")
                            .fontWeight(.semibold)
                        Text("Seguidos")
                            .font(.footnote)
                    }
                }
                .foregroundColor(Color(.systemGray4))
                
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 6)
                    .foregroundColor(Color(.systemGray6))
                
                // Segmented control
                VStack {
                    HStack {
                        ForEach(ProfileFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                if selectedFilter == filter {
                                    Rectangle()
                                        .frame(width: filterBarWidth, height: 1)
                                        .foregroundColor(.black)
                                        .matchedGeometryEffect(id: "item", in: animation)
                                } else {
                                    Rectangle()
                                        .frame(width: filterBarWidth, height: 1)
                                        .foregroundColor(.clear)
                                    
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedFilter = filter
                                }
                            }
                            
                        }
                    }
                }
                .padding(.vertical, 20)
                
                // Content
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(0...10, id: \.self) { recipe in
                        RecipeCellView(recipe: MockData.recipes[1])
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement:.topBarTrailing) {
                    Button {
                        //cerrar sesion
                        AuthService.shared.signOut()
                    } label: {
                        Image("line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
                
            }
            .padding(.horizontal)
           
        }
        
    }
}

#Preview {
    ProfileView()
}
