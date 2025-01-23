import Foundation
import SwiftUI

/// ViewModel to manage the categories, subcategories, and their selections.
class CategoriesViewModel: ObservableObject {
    
    /// List of categories displayed in the app.
    @Published var categories: [Category] = [
        Category(
            title: "Medications",
            imageName: CategoryImages.img_medications.rawValue,
            isSelected: false,
            subCategories: [
                SubCategoriesData(
                    title: "Face Care",
                    imageName: CategoryImages.img_face.rawValue,
                    isSelectedProduct: false,
                    products: [
                        ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                        ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue),
                        ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                        ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue),
                        ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                        ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue)
                    ]),
                SubCategoriesData(title: "Body Care", imageName: CategoryImages.img_face.rawValue,
                                  isSelectedProduct: false,
                                  products: [
                                    ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                                    ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue)
                                    
                                  ]),
                SubCategoriesData(title: "Hand & Foot", imageName: CategoryImages.img_face.rawValue,
                                  isSelectedProduct: false,
                                  products: [
                                    ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                                    ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue)
                                    
                                  ]),
                SubCategoriesData(title: "Makeup & Accessories", imageName: CategoryImages.img_face.rawValue,
                                  isSelectedProduct: false,products: [
                    ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                    ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue)
                    
                ]),
                SubCategoriesData(title: "Sun Protection", imageName: CategoryImages.img_face.rawValue,
                                  isSelectedProduct: false,
                                  products: [
                                    ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                                    ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue)
                                    
                                  ])]
        ),
        Category(
            title: "Hair Care",
            imageName: CategoryImages.img_hairCare.rawValue,
            isSelected: false,
            subCategories: [SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue,
                                              isSelectedProduct: false,
                                              products: [
                                                ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                                                ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue)
                                                
                                              ])]
        ),
        Category(
            title: "Beauty & Skin Care",
            imageName: CategoryImages.img_beauty.rawValue,
            isSelected: false,
            subCategories: [SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue,
                                              isSelectedProduct: false,
                                              products: [
                                                ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                                                ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue)
                                                
                                              ])]
        ),
        Category(
            title: "Oral Care",
            imageName: CategoryImages.img_oralCare.rawValue,
            isSelected: false,
            subCategories: [SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue,
                                              isSelectedProduct: false,
                                              products: [
                                                ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                                                ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue)
                                                
                                              ])]
        ),
        Category(
            title: "Baby & Mom Care",
            imageName: CategoryImages.img_momCare.rawValue,
            isSelected: false,
            subCategories: [SubCategoriesData(title: "Face Care", imageName: CategoryImages.img_face.rawValue,
                                              isSelectedProduct: false,
                                              products: [
                                                ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                                                ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue)
                                                
                                              ])]
        ),
        Category(
            title: "Vitabiotics",
            imageName: CategoryImages.img_vitabiotics.rawValue,
            isSelected: false,
            subCategories: [SubCategoriesData(title: "Face Care", 
                                              imageName: CategoryImages.img_face.rawValue,
                                              isSelectedProduct: false,
                                              products: [
                                                ProductsData(title: "Body Powder", imageName: CategoryImages.img_bodyPowder.rawValue),
                                                ProductsData(title: "Deodorants", imageName: CategoryImages.img_deodorants.rawValue)
                                                
                                              ])]
        )
    ]
    /// List of carousel items to be displayed in a banner.
    @Published var carouselItems: [CarouselItem] = [
        CarouselItem(imageName: CategoryImages.img_banner.rawValue),
        CarouselItem(imageName: CategoryImages.img_banner.rawValue),
        CarouselItem(imageName: CategoryImages.img_banner.rawValue),
        CarouselItem(imageName: CategoryImages.img_banner.rawValue),
        CarouselItem(imageName: CategoryImages.img_banner.rawValue)
    ]
    /// Currently selected category.
    @Published var selectedCategory: Category? = nil
    
    /// Selects or deselects a category.
       /// - Parameter category: The category to be toggled.
    func selectCategory(_ category: Category) {
        categories = categories.map { existingCategory in
            var updatedCategory = existingCategory

            if existingCategory.id == category.id {
                // Toggle the selection for the clicked category
                updatedCategory.isSelected = !existingCategory.isSelected
            } else {
                // Deselect all other categories
                updatedCategory.isSelected = false
            }

            return updatedCategory
        }

        // Update the selected category, or set it to nil if the category is deselected
        selectedCategory = categories.first { $0.isSelected }
    }

    /// Toggles the selection of a subcategory and deselects other subcategories in the same category.
        /// - Parameters:
        ///   - category: The parent category of the subcategory.
        ///   - subCategory: The subcategory to be toggled.
    func toggleSubCategorySelection(in category: Category, subCategory: SubCategoriesData) {
        categories = categories.map { existingCategory in
            var updatedCategory = existingCategory

            if existingCategory.id == category.id {
                // Update only the subcategories of the clicked category
                updatedCategory.subCategories = updatedCategory.subCategories.map { existingSubCategory in
                    var updatedSubCategory = existingSubCategory
                    if existingSubCategory.id == subCategory.id {
                        // Toggle the selection state of the clicked subcategory
                        updatedSubCategory.isSelectedProduct = !existingSubCategory.isSelectedProduct
                    } else {
                        // Deselect all other subcategories
                        updatedSubCategory.isSelectedProduct = false
                    }
                    return updatedSubCategory
                }
            } else {
                // Deselect all subcategories of other categories
                updatedCategory.subCategories = updatedCategory.subCategories.map { existingSubCategory in
                    var updatedSubCategory = existingSubCategory
                    updatedSubCategory.isSelectedProduct = false
                    return updatedSubCategory
                }
            }

            return updatedCategory
        }
    }



}
