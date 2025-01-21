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
            
            // Overlay DatePicker
            if showDatePicker {
                VStack {
                    DatePicker(
                        "Select Time",
                        selection: $selectedTime,
                        displayedComponents: .hourAndMinute
                    )
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .onChange(of: selectedTime) { newValue in
                        textFieldValue = formatter.string(from: newValue)
                        callBackTime = textFieldValue
                    }
                    
                    // Done button
                    Button("Done") {
                        showDatePicker = false // Dismiss the picker
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 8)
                .padding()
            }
            HStack {
                TextField("", text: $textFieldValue)
                    .disabled(true) // Disable direct text input
                    .textStyle(
                        size: 16,
                        color: textFieldValue == InputFields.txt_timeForCallBAck ?
                               Color(UIColor.appclrB6B7B7) : Color(UIColor.appclr000000),
                        fontName: FontConstant.Almarai_Regular
                    )
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
                    .stroke(Color(UIColor.appclrDDDDDD), lineWidth: 1)
            }
            
           
        }
        .animation(.easeInOut, value: showDatePicker)
    }
}
