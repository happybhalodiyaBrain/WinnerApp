
import SwiftUI

struct ExpandedCategoryView: View {
    let category: Category
    let onSubCategoryTap: (SubCategoriesData) -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            ForEach(category.subCategories) { item in
                VStack {
                    // Display subcategory image dynamically
                    HStack {
                        Image(CategoryImages.img_face.rawValue)
                            .resizable()
                            .frame(width: 30, height: 29)
                        Text(item.title)
                            .textStyle(size: 14,
                                       color: Color(UIColor.appclr000000),
                                       fontName: FontConstant.Almarai_Regular)
                            .padding(.leading,16)
                        Spacer()
                        Image(systemName: item.isSelectedProduct ? "chevron.up" : "chevron.down")
                            .frame(width: 8, height: 8)
                    }.onTapGesture {
                        onSubCategoryTap(item)
                    }
                    Divider()
                }.padding(.trailing, 12)
                if item.isSelectedProduct {
                    // Show the products grid view when subcategory is selected
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(Array(item.products.enumerated()), id: \.offset) { index, product in
                            if index < 5 {
                                ProductCard(product: product)
                            } else if index == 5 { // Show "View All" button at the 6th index
                                VStack {
                                    Button(action: {
                                        print("View All tapped")
                                    }) {
                                        VStack {
                                            Image(systemName: "list.bullet")
                                                .resizable()
                                                .frame(width: 24, height: 15)
                                                .foregroundColor(Color(UIColor.appclr000000)) // Customize color as needed
                                            
                                            Text(Buttons.btn_viewAll)
                                                .textStyle(size: 10, color: Color(UIColor.appclr000000), fontName: FontConstant.Almarai_Regular)
                                        }
                                    } .frame(width: 75, height: 75)
                                }.background(.white)
                                    
                            }
                        }
                     
                            
                    }
                    .background(Color(UIColor.appclrFAFAFA))
                        .padding(.vertical, 8)
                    
                }
            }
        }
    }
}
// MARK: - Reusable Product Card
struct ProductCard: View {
    let product: ProductsData
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 75, height: 75)
                .background(Color.white)
            
            Text(product.title)
                .textStyle(size: 10, color: Color(UIColor.appclr000000), fontName: FontConstant.Almarai_Regular)
        }
    }
}
