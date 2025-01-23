

import SwiftUI

// MARK: - CategoryCard View
/// A view representing a single category card with an image and title.
/// - Triggers an action when tapped.
/// - Highlights the card if it is selected.
struct CategoryCard: View {
    
    // MARK: - Properties
    /// The category to display.
    let category: Category
    /// Action triggered when the category card is tapped.
    let onCategoryTap: (Category) -> Void
    // MARK: - Body
    var body: some View {
        Button(action: {
            withAnimation {
                onCategoryTap(category) // Trigger onCategoryTap with the tapped category
            }
        }) {
            ZStack(alignment: .topLeading) {
                // The main image representing the category.
                Image(category.imageName)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                
                /// Displays the category title and a dropdown icon.
                HStack {
                    Text(category.title)
                        .textStyle(size: 13, color: Color(UIColor.appclr000000), fontName: FontConstant.Almarai_Regular)
                    Image(Icons.ic_smallDropDown.rawValue)
                        .resizable()
                        .frame(width: 8, height: 8)
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 11)
            }
            .frame(width: 104, height: 150)
            /// Adds a background color and a border to indicate selection.
            .background(Color(UIColor.appclrF8F8CD))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(category.isSelected ? Color(UIColor.appclr011F79) : Color.clear, lineWidth: 2)
            )
            .cornerRadius(8)
            /// Adds a subtle shadow for visual depth.
            .shadow(color: Color.black.opacity(0.1), radius: 4)
        }
    }
}

