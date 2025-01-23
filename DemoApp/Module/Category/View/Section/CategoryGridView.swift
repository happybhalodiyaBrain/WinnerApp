import SwiftUI

/// A grid view displaying categories and their expanded subcategories when selected.

struct CategoryGridView: View {
    /// Binding to the array of categories, allowing for updates to selection states.
    @Binding var categories: [Category]
    /// Callback when a category is tapped.
    let onCategoryTap: (Category) -> Void
    /// Callback when a subcategory is tapped.
    let onSubCategoryTap: (Category, SubCategoriesData) -> Void
    /// Grid layout with three flexible columns.
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    /// State object for managing the categories view model.
    @StateObject private var viewModel = CategoriesViewModel()
    
    var body: some View {
        ScrollView {
            Grid(horizontalSpacing: 16, verticalSpacing: 16) {
                // Iterate over the chunks of categories
                ForEach(chunks(of: 3, in: categories), id: \.self) { chunk in
                    GridRow {
                        ForEach(chunk, id: \.self) { category in
                            VStack(spacing: 8) {
                                // Category Card for each item
                                CategoryCard(category: category, onCategoryTap: { tappedCategory in
                                    withAnimation {
                                        onCategoryTap(tappedCategory)
                                    }
                                })
                            }
                        }
                    }
                    
                    // Show the expanded view for each tapped category
                    ForEach(Array(chunk.enumerated()), id: \.element.self) { index, category in
                        if category.isSelected  {
                            VStack{
                                if index == 0 { // First element
                                    CustomDivider(color: Color(UIColor.appclr0A195C), lineWidth: 1, borderWidth: 1, alignment: .leading)
                                } else if index == chunk.count - 1 { // Last element
                                    CustomDivider(color: Color(UIColor.appclr0A195C), lineWidth: 1, borderWidth: 1, alignment: .trailing)
                                } else { // Center element
                                    CustomDivider(color: Color(UIColor.appclr0A195C), lineWidth: 1, borderWidth: 1, alignment: .center)
                                }
                                
                                ExpandedCategoryView(category: category,
                                                     onSubCategoryTap: { subCategory in
                                    onSubCategoryTap(category, subCategory)
                                })
                                .frame(maxWidth: .infinity) // Ensure full width
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// Helper method to divide an array into chunks of a specified size.
        /// - Parameters:
        ///   - size: The size of each chunk.
        ///   - array: The array to chunk.
        /// - Returns: A 2D array where each inner array represents a chunk of the original array.
    private func chunks(of size: Int, in array: [Category]) -> [[Category]] {
        var chunks: [[Category]] = []
        for i in stride(from: 0, to: array.count, by: size) {
            let chunk = Array(array[i..<min(i + size, array.count)])
            chunks.append(chunk)
        }
        return chunks
    }
}
