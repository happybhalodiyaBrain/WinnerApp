//
//  CategoriesViewModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 22/01/25.
//

import Foundation
import SwiftUI

class CategoriesViewModel: ObservableObject {
    @Published var categories: [Category] = [
        Category( title: "Medications", imageName: CategoryImages.img_medications.rawValue, isSelected: false),
        Category( title: "Hair Care", imageName: CategoryImages.img_hairCare.rawValue, isSelected: false),
        Category( title: "Beauty & Skin Care", imageName: CategoryImages.img_beauty.rawValue, isSelected: true),
        Category( title: "Oral Care", imageName: CategoryImages.img_oralCare.rawValue, isSelected: false),
        Category( title: "Baby & Mom Care", imageName: CategoryImages.img_momCare.rawValue, isSelected: false),
        Category( title: "Vitabiotics", imageName: CategoryImages.img_vitabiotics.rawValue, isSelected: false)
    ]
    
    @Published var carouselItems: [CarouselItem] = [
        CarouselItem(imageName: CategoryImages.img_banner.rawValue),
        CarouselItem(imageName: CategoryImages.img_banner.rawValue),
        CarouselItem(imageName: CategoryImages.img_banner.rawValue),
        CarouselItem(imageName: CategoryImages.img_banner.rawValue),
        CarouselItem(imageName: CategoryImages.img_banner.rawValue)
    ]
    
    @Published var selectedCategory: Category? = nil

    func selectCategory(_ category: Category) {
        categories = categories.map {
            Category(title: $0.title, imageName: $0.imageName, isSelected: $0.id == category.id)
        }
        selectedCategory = category
    }
}
