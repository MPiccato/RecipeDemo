//
//  RecipeTabView.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 26/01/2024.
//

import SwiftUI

struct RecipeTabView: View {
    @State private var selectedTab: Int = 0
    @State private var showScanView: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill"
                          : "house").environment(\.symbolVariants,
                                                  selectedTab == 0 ? .fill : .none)
                }
                .onAppear(perform: {
                    selectedTab = 0
                })
                .tag(0)
            Text("Subir")
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "pencil.line"
                          : "pencil")
                }
                .onAppear(perform: {
                    selectedTab = 1
                })
                .tag(1)
            Text("Scan View")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear(perform: {
                    selectedTab = 2
                })
                .tag(2)
            Text("Notificaciones")
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "bell.fill"
                          : "bell")
                }
                .onAppear(perform: {
                    selectedTab = 3
                })
                .tag(3)
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill"
                          : "person").environment(\.symbolVariants,
                                                  selectedTab == 4 ? .fill : .none)
                }
                .onAppear(perform: {
                    selectedTab = 4
                })
                .tag(4)
        }
        .onChange(of: selectedTab) {oldValue, newValue in
            showScanView = selectedTab == 2
            
        }
        .sheet(isPresented: $showScanView,onDismiss: {
            selectedTab = 0
        }, content: {
            EmptyView()
        })
        .tint(.green)
    }
}

#Preview {
    RecipeTabView()
}
