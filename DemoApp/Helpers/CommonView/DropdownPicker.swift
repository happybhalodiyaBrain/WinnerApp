//
//  DropdownPicker.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation
import SwiftUI

/// A custom dropdown picker view for selecting an option from a list.
struct DropdownPicker: View {
    // MARK: - Properties  
    /// The list of options to display in the dropdown menu.
    let options: [String]
    /// A binding to the selected option.
    @Binding var selectedOption: String
    /// The placeholder text to display when no option is selected.
    let placeholder: String
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Menu Button to trigger the dropdown
            Menu {
                // Loop through options and create buttons for each option
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        selectedOption = option
                    }) {
                        Text(option)
                    }
                }
            } label: {
                HStack {
                    // Display the selected option or placeholder
                    Text(selectedOption.isEmpty ? placeholder : selectedOption)
                        .foregroundColor(selectedOption.isEmpty ? Color(UIColor.appclrB6B7B7) : Color(UIColor.appclr000000))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    // Dropdown icon
                    Image(Icons.ic_dropDown.rawValue)
                        .frame(width: 22, height: 22)
                }
                .padding()
                .frame(height: 44)// Set the height of the dropdown picker
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(UIColor.appclrDDDDDD), lineWidth: 1)
                )
            }
        }
    }
}

