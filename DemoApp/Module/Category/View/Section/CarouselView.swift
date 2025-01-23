//
//  CarouselView.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 22/01/25.
//

import SwiftUI

/// A custom carousel view that displays a series of images with a custom page indicator.

struct CarouselView: View {
    /// Array of carousel items to display in the carousel.
    let items: [CarouselItem]
    /// The currently displayed page in the carousel.
    @State private var currentPage = 0
    var body: some View {
        
        ZStack(alignment: .bottom) {
            // Carousel with TabView
            TabView(selection: $currentPage) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 156)
                        .cornerRadius(8)
                        .clipped()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default dots
            
            // Custom Page Control
            HStack(spacing: 3) {
                ForEach(0..<items.count, id: \.self) { index in
                    Circle()
                        .fill(index == currentPage ? Color(UIColor.appclr3F9ACC) : Color(UIColor.appclrA1A1A1))
                        .frame(width: 4, height: 4)
                }
            }
            .padding(3)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color(UIColor.appclrFFFFFF)) // Background color
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2) 
            )
            .padding(.bottom, -4)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 158)
    }
}

#Preview {
    CarouselView(items: [CarouselItem(imageName: CategoryImages.img_banner.rawValue)])
}
