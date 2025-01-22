//
//  CategoriesView.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 22/01/25.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject private var viewModel = CategoriesViewModel()
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
            
            CategoryGridView(categories: $viewModel.categories) { selectedCategory in
                viewModel.selectCategory(selectedCategory)
            }.padding(.top, 29)
                .padding(.horizontal, 16)
            Spacer()
            
        }
       
    }
}

#Preview {
    CategoriesView()
}
