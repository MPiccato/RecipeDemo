//
//  UploadView2.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 04/02/2024.
//

import SwiftUI



struct UploadView2: View {
    @State private var ingredients: [String] = [""]
    @State private var descriptionFood: String = ""
    @Environment(\.dismiss) private var dismiss
    @State private var showingImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    @Binding var selectedTab: Int
    @State private var showModal = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                Color.black.opacity(showModal ? 0.4 : 0)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Ingredientes")
                            .font(.title2)
                            .foregroundColor(.gray)
                        Spacer()
                        
                        Text("* grupo")
                            .font(.title2)
                            .foregroundColor(.gray)
                    }
                    
                    ForEach(0..<ingredients.count, id: \.self) {
                       index in
                        HStack {
                            Image(systemName: "slider.horizontal.3")
                            TextField("Ingresa ingrediente", text: self.binding(forIndex: index))
                                .frame(height: 40)
                                .modifier(TextViewModifier())
                        }
                    }
                    Button {
                        self.addIngredients()
                    } label: {
                        Text("Agregar ingrediente")
                            .frame(height: 48)
                            .frame(maxWidth: .infinity)
                            .font(.title3)
                            .foregroundColor(.gray)
                            .modifier(TextViewModifier())
                    }
                    Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 6)
                        .foregroundColor(Color(.systemGray6))
                        .padding(.horizontal, -40)
                    
                    if showModal {
                        ModalView(showModal: $showModal, selectedTab: $selectedTab)
                            .transition(.scale)
                            .animation(.easeInOut(duration:0.3))
                            .zIndex(1)
                    }
                    Text("Pasos")
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    HStack(alignment: .top) {
                        VStack(spacing: 16) {
                            Image("numberone")
                                .resizable()
                                .frame(width:30, height: 30)
                            
                            Image(systemName: "slider.horizontal.3")
                        }
                        .padding(.vertical, 12)
                        
                        VStack {
                            TextField("Di algo acerca de la comida", text: $descriptionFood, axis:.vertical)
                                .frame(height: 148)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.systemGray3), lineWidth: 1)
                                        .padding(.horizontal, -12)
                                }
                                .padding(.horizontal, 24)
                            
                            if let image = selectedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .cornerRadius(15)
                                    .onTapGesture {
                                        self.showingImagePicker = true
                                    }
                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color(.systemGray6))
                                        .frame(height: 50)
                                        .padding(.horizontal, 10)
                                    
                                    Image(systemName: "camera.fill")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(.gray)
                                }
                                .onTapGesture {
                                    self.showingImagePicker = true
                                }
                            }
                        }
                    }
                    HStack {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Volver")
                                .frame(height: 60)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .background(Color(.systemGray6))
                                .cornerRadius(30)
                        })
                        
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Seguir")
                                .frame(height: 60)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                .background(.green)
                                .cornerRadius(30)
                        })
                    }
                    .padding(.vertical, 32)
                }
                .sheet(isPresented: $showingImagePicker, content: {
                    ImagePicker(selectedImage: self.$selectedImage, sourceType: .photoLibrary)
                })
                .padding(.horizontal, 50)
                .padding(.horizontal, 24)
            }
        }
    }
    
    private func binding(forIndex index: Int) -> Binding<String> {
        return Binding<String> (
            get: {
                self.ingredients[index]
            },
            set: { newValue in
                self.ingredients[index] = newValue
            }
        )
    }
    
    private func addIngredients() {
        ingredients.append("")
    }
}

#Preview {
    UploadView2(selectedTab: .constant(1))
}
