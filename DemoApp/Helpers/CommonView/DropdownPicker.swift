//
//  DropdownPicker.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation
import SwiftUI

struct DropdownPicker: View {
    // MARK: - Properties   
    let options: [String]
    @Binding var selectedOption: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Menu Button
            Menu {
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selectedOption = option
                    }) {
                        Text(option)
                    }
                }
            } label: {
                HStack {
                    Text(selectedOption.isEmpty ? placeholder : selectedOption)
                        .foregroundColor(selectedOption.isEmpty ? Color(UIColor.appclrB6B7B7) : Color(UIColor.appclr000000))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(Icons.ic_dropDown.rawValue)
                        .frame(width: 22, height: 22)
                }
                .padding()
                .frame(height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(UIColor.appclrDDDDDD), lineWidth: 1)
                )
            }
        }
    }
}

