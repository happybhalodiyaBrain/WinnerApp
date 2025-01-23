//
//  CategoryModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 22/01/25.
//

import Foundation
/// Represents a category in the application.
struct Category: Identifiable, Equatable, Hashable {
    /// Unique identifier for the category.
    let id = UUID()
    /// Title of the category.
    let title: String
    /// Name of the image associated with the category.
    let imageName: String
    /// Indicates whether the category is selected or not. Default is `false`.
    var isSelected: Bool = false
    /// A list of subcategories under this category.
    var subCategories : [SubCategoriesData]
}
/// Represents a subcategory under a category.
struct SubCategoriesData : Identifiable, Equatable , Hashable{
    /// Unique identifier for the subcategory.
    let id = UUID()
    /// Title of the subcategory.
    let title: String
    /// Name of the image associated with the subcategory.
    let imageName: String
    /// Indicates whether a product within this subcategory is selected. Default is `false`.
    var isSelectedProduct: Bool = false
    /// A list of products under this subcategory.
    let products : [ProductsData]
}
/// Represents a product under a subcategory.

struct ProductsData : Identifiable, Equatable , Hashable{
    /// Unique identifier for the product.
    let id = UUID()
    /// Title of the product.
    let title: String
    /// Name of the image associated with the product.
    let imageName: String
}
/// Represents an item in a carousel.
struct CarouselItem: Identifiable {
    /// Unique identifier for the carousel item.
    let id = UUID()
    /// Name of the image associated with the carousel item.
    let imageName: String
}
