//
//  UploadView.swift
//  RecipeDemo
//
//  Created by Martin Piccato on 04/02/2024.
//

import SwiftUI

struct UploadView: View {
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    @State private var FoodName: String = ""
    @State private var descriptionFood: String = ""
    @State private var timePreparation = 0.0
    
    @Binding var selectedTab: Int
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(height:200)
                            .cornerRadius(15)
                            .onTapGesture {
                                self.showingImagePicker = true
                            }
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .foregroundColor(.gray)
                                .frame(height:200)
                            VStack {
                                Image(systemName: "photo.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.gray)
                                Text("Add Cover Photo")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                Text("up to 12 Mb")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onTapGesture {
                            self.showingImagePicker = true
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Food Name")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.leading, 24)
                        TextField("Enter Food Name", text: $FoodName)
                            .frame(height: 48)
                            .modifier(TextViewModifier())
                    }
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.leading, 24)
                        TextField("Di algo respecto de esta receta", text: $descriptionFood, axis: .vertical)
                            .frame(height: 148)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color(.systemGray3), lineWidth: 1)
                                    .padding(.horizontal, -12)
                            }
                            .padding(.horizontal, 24)
                            
                    }
                    
                    HStack {
                        Text("Tiempo de cocción")
                            .foregroundColor(.black)
                        Text("en minutos")
                            .foregroundColor(.gray)
                    }
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    
                    // Slider
                    VStack {
                        HStack {
                            Text("<10")
                            
                            Spacer()
                            
                            Text("30")
                            Spacer()
                            Text(">60")
                        }
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                        Slider(value: $timePreparation, in: 10...70, step: 30.0)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .accentColor(.green)
                    }
                    .padding(.horizontal)
                    
                    NavigationLink {
                        UploadView2(selectedTab: $selectedTab)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Next")
                            .modifier(RoundedColorB(color: .green))
                    }
                }
                .sheet(isPresented: $showingImagePicker, content: {
                    ImagePicker(selectedImage: self.$selectedImage, sourceType: .photoLibrary)
                })
            }
            .padding()
        }
    }
}

#Preview {
    UploadView(selectedTab: .constant(1))
}

struct RoundedColorB: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .frame(height:40)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(.horizontal)
            .background(color)
            .cornerRadius(24)
            .padding(.horizontal,24)
    }
}
