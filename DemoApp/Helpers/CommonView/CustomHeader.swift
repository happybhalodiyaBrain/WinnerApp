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
    
    var body: some View {
        HStack {
            Button(action: onBackTapped) {
                Image(Icons.ic_backButton.rawValue)
                    .frame(width: 24, height: 24)
            }
            
            // Greeting text
            Text(greetingText)
                .headerTextStyle()
                .padding(.leading, 15)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color.white) // Customize your background color
        .overlay(
            Divider(), alignment: .bottom
        )
    }
}
