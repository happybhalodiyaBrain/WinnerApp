//
//  CustomHeader.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation
import SwiftUI

struct CustomHeader: View {
    
    let greetingText: String
    let onBackTapped: () -> Void
    let showRightButtons: Bool
    let showBackButton: Bool
    let cartBadgeCount: Int
    
    var body: some View {
        HStack {
            if showBackButton {
                Button(action: onBackTapped) {
                    Image(Icons.ic_backButton.rawValue)
                        .frame(width: 24, height: 24)
                }
            }
            // Greeting text
            Text(greetingText)
                .headerTextStyle()
                .padding(.leading,showBackButton ? 15: 16)
            
            Spacer()
            
            // MARK: - Right Buttons
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
        }
        .padding(.horizontal)
        .padding(.vertical, 11)
        .background(Color.white) // Customize your background color
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 1) // Add shadow below the header
    }
}

#Preview {
    CustomHeader(greetingText: "Notification", onBackTapped: {}, showRightButtons: true, showBackButton : false, cartBadgeCount: 3)
}
