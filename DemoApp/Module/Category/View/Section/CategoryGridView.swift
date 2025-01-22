//
//  CategoryGridView.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 22/01/25.
//

import SwiftUI

struct CategoryGridView: View {
    @Binding var categories: [Category]
    let onCategoryTap: (Category) -> Void
    @State private var expandedCategory: UUID?
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(categories) { category in
                VStack(spacing: 8) {
                    Button(action: {
                        withAnimation {
                            expandedCategory = (expandedCategory == category.id) ? nil : category.id
                            onCategoryTap(category)
                        }
                    }) {
                        ZStack(alignment: .topLeading) {
                            Image(category.imageName)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(8)
                            
                            HStack{
                                Text(category.title)
                                    .textStyle(size: 13,color: Color(UIColor.appclr000000),
                                               fontName: FontConstant.Almarai_Regular)
                                Image(Icons.ic_smallDropDown.rawValue)
                                    .resizable()
                                    .frame(width: 8,height: 8)
                                
                            }.padding(.horizontal,8)
                                .padding(.vertical, 11)
                        }
                        
                        
                        .frame(width: 104, height: 150)
                        .background(Color(UIColor.appclrF8F8CD))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(category.isSelected ? Color(UIColor.appclr011F79) : Color.clear, lineWidth: 2)
                        )
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 4)
                    }
                    Spacer()
                    // Expandable Subcategories
                    if expandedCategory == category.id {
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(category.subCategories) { subCategory in
                                HStack {
                                    Image(CategoryImages.img_face.rawValue)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .cornerRadius(4)
                                    
                                    Text(subCategory.title)
                                        .font(.system(size: 12))
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    Image(Icons.ic_smallDropDown.rawValue)
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .cornerRadius(4)
                                }
                                .padding()
                                .cornerRadius(8)
                            }
                        }
                        .padding(.top, 8)
                        .transition(.opacity) // Smooth transition
                    }
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    // Sample Categories for Preview
    @State var sampleCategories = [
        Category(
            title: "Medications",
            imageName: CategoryImages.img_medications.rawValue,
            isSelected: false,
            subCategories: [
                SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue),
                SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue)]
        ),
        Category(
            title: "Hair Care",
            imageName: CategoryImages.img_hairCare.rawValue,
            isSelected: false,
            subCategories: [SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue)]
        ),
        Category(
            title: "Beauty & Skin Care",
            imageName: CategoryImages.img_beauty.rawValue,
            isSelected: true,
            subCategories: [SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue)]
        ),
        Category(
            title: "Oral Care",
            imageName: CategoryImages.img_oralCare.rawValue,
            isSelected: false,
            subCategories: [SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue)]
        ),
        Category(
            title: "Baby & Mom Care",
            imageName: CategoryImages.img_momCare.rawValue,
            isSelected: false,
            subCategories: [SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue)]
        ),
        Category(
            title: "Vitabiotics",
            imageName: CategoryImages.img_vitabiotics.rawValue,
            isSelected: false,
            subCategories: [SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue)]
        )
    ]
    
    return CategoryGridView(categories: $sampleCategories) { category in
        // Handle category tap for preview
        print("\(category.title) tapped")
    }
}
