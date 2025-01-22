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
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(categories) { category in
                Button(action: {
                    onCategoryTap(category)
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
            }
        }
       
    }
}

#Preview {
    // Sample Categories for Preview
    @State var sampleCategories = [
        Category( title: "Medications", imageName: CategoryImages.img_medications.rawValue, isSelected: false),
        Category( title: "Hair Care", imageName: CategoryImages.img_hairCare.rawValue, isSelected: false),
        Category( title: "Beauty & Skin Care", imageName: CategoryImages.img_beauty.rawValue, isSelected: true),
        Category( title: "Oral Care", imageName: CategoryImages.img_oralCare.rawValue, isSelected: false),
        Category( title: "Baby & Mom Care", imageName: CategoryImages.img_momCare.rawValue, isSelected: false),
        Category( title: "Vitabiotics", imageName: CategoryImages.img_vitabiotics.rawValue, isSelected: false)
    ]
    
    return CategoryGridView(categories: $sampleCategories) { category in
        // Handle category tap for preview
        print("\(category.title) tapped")
    }
}
