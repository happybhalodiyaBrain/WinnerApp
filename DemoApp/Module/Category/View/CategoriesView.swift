//
//  CategoriesView.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 22/01/25.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject private var viewModel = CategoriesViewModel()
    @State private var expandedCategory: Category?
    
    var body: some View {
        VStack {
            // MARK: - Custom Header
            CustomHeader(
                greetingText: Header.categories,
                onBackTapped: {},
                showRightButtons: true,
                showBackButton: false,
                cartBadgeCount: 02,
                isShowingFiler: false
            )
            
            //MARK: - Carousel view
            CarouselView(items: viewModel.carouselItems)
                .padding(.horizontal, 16)
                .padding(.top, 16)
            
            //MARK: - Category grid view 
            CategoryGridView(
                categories: $viewModel.categories,
                onCategoryTap: { selectedCategory in
                    // Handle category selection
                    viewModel.selectCategory(selectedCategory)
                },
                onSubCategoryTap: { category, subCategory in
                       // Handle subcategory selection from the main view
                       viewModel.toggleSubCategorySelection(in: category, subCategory: subCategory)
                   }
            )   
            .padding(.horizontal, 16)
                .padding(.top, 29)
              
        }
        
    }
}

#Preview {
    CategoriesView()
}
