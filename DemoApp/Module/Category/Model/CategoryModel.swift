//
//  CategoryModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 22/01/25.
//

import Foundation

struct Category: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let imageName: String
    var isSelected: Bool = false
    var subCategories : [SubCategoriesData]
}

struct SubCategoriesData : Identifiable, Equatable {
    let id = UUID()
    let title: String
    let imageName: String
}
struct CarouselItem: Identifiable {
    let id = UUID()
    let imageName: String
}
