//
//  CustomHeader.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation
import SwiftUI

/// A reusable header view with customizable options for navigation and actions.
struct CustomHeader: View {
    
    // MARK: - Properties
    /// The greeting or title text displayed in the header.
    let greetingText: String
    /// The action performed when the back button is tapped.
    let onBackTapped: () -> Void
    /// Flag to determine whether to show right-side buttons (heart and cart).
    let showRightButtons: Bool
    /// Flag to determine whether to show the back button.
    let showBackButton: Bool
    /// The badge count for the cart button.
    let cartBadgeCount: Int
    /// Filter button showing in right side
    let isShowingFiler : Bool
    
    // MARK: - Body
    var body: some View {
        HStack {
            // MARK: Back Button
            if showBackButton {
                Button(action: onBackTapped) {
                    Image(Icons.ic_backButton.rawValue)
                        .frame(width: 24, height: 24)
                }
            }
            // MARK: Greeting Text
            Text(greetingText)
                .headerTextStyle()
                .padding(.leading,showBackButton ? 15: 16)
            
            Spacer()
            
            // MARK: Right Buttons Section
            if showRightButtons {
                HStack(spacing: 27) {
                    // Heart Icon Button
                    Button(action: {
                        // Heart button action
                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(UIColor.appclr0A195C)) // Change color as needed
                    }
                    
                    // Cart Icon Button with Badge
                    ZStack {
                        Button(action: {
                            // Cart button action
                        }) {
                            Image(systemName: "cart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(UIColor.appclr0A195C)) // Change color as needed
                        }
                        
                        // Badge for the cart
                        if cartBadgeCount > 0 {
                            Text("\(cartBadgeCount)")
                                .font(.caption2)
                                .foregroundColor(.white)
                                .padding(5)
                                .background(Color(UIColor.appclrEB0E3C))
                                .clipShape(Circle())
                                .offset(x: 10, y: -10)
                        }
                    }
                }.padding(.trailing, 16)
            }
            if(isShowingFiler){
                HStack{
                    Image(Icons.ic_filter.rawValue)
                        .resizable()
                        .frame(width: 16, height: 17)
                    Text("Filter")
                        .textStyle(size: 12,
                                   color: Color(UIColor.appclr3F9ACC),
                                   fontName: FontConstant.Almarai_Bold )
                }.padding(.trailing, 18)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 11)
        .background(Color.white) // Customize your background color
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1) // Add shadow below the header
        
        
    }
}

#Preview {
    CustomHeader(greetingText: "Notification", onBackTapped: {}, showRightButtons: false, showBackButton : true, cartBadgeCount: 3, isShowingFiler: true)
}
