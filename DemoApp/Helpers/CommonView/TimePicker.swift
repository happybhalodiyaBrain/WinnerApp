//
//  TimePicker.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation
import SwiftUI

struct TimePickerView: View {
    // MARK: - Properties
    @Binding var callBackTime: String // Bind the callBackTime variable
    @State private var selectedTime: Date = Date() // Holds the currently selected time
    @State private var showDatePicker = false  // Flag to toggle visibility of the DatePicker
    @State private var textFieldValue: String = InputFields.txt_timeForCallBAck // Text field value displaying the selected time
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        VStack {
            // Text field and clock icon button to open the date picker
            HStack {
                TextField("", text: $textFieldValue)
                    .disabled(true) // Disable direct text input
                    .textStyle(size: 16, color: textFieldValue == InputFields.txt_timeForCallBAck ?
                               Color(UIColor.appclrB6B7B7): Color(UIColor.appclr000000), fontName: FontConstant.Almarai_Regular)
                    .accentColor(Color(UIColor.appclr000000))
                    .animation(Animation.easeInOut(duration: 0.4), value: EdgeInsets())
                    .frame(alignment: .leading)
                    .onTapGesture {
                        showDatePicker.toggle()
                    }
                // Clock icon button to open the DatePicker
                Button(action: {
                    showDatePicker.toggle()
                }) {
                    Image(systemName: "clock")
                        .foregroundColor(Color(UIColor.appclr3F9ACC))
                }
                .padding(.trailing, 8)
            }
            .padding()
            .background(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(height: 44)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(UIColor.appclrDDDDDD),lineWidth: 1)
            }
            // Show the DatePicker if the showDatePicker flag is true
            if showDatePicker {
                DatePicker(
                    "Select Time",
                    selection: $selectedTime,
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(CompactDatePickerStyle())
                .labelsHidden()
                .onChange(of: selectedTime) { newValue in
                    textFieldValue = formatter.string(from: newValue) // Update the TextField with the selected time
                    callBackTime = textFieldValue
                    showDatePicker = false // Hide the picker after selection
                }
            }
        }
    }
}

