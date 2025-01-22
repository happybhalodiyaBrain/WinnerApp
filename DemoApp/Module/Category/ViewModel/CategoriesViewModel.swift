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
        Category(
            title: "Medications",
            imageName: CategoryImages.img_medications.rawValue,
            isSelected: false,
            subCategories: [SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue)]
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
            Category(
                title: $0.title,
                imageName: $0.imageName,
                isSelected: $0.id == category.id, // Set isSelected only for the tapped category
                subCategories: $0.subCategories  // Preserve subCategories
            )
        }
        selectedCategory = categories.first(where: { $0.id == category.id })
    }
}
