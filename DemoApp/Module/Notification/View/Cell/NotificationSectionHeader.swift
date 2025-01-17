import SwiftUI

/// A view that displays the date header for a notification section.
struct NotificationSectionHeader: View {
    
    // MARK: - Properties
        
        /// The date to be displayed in the header.
    let date: String
    // MARK: - Body
       var body: some View {
           VStack{
               // Displaying the date with custom styling
               Text(date)
                   .textStyle(size: 12,
                              color: Color(UIColor.appclr92949F),
                              fontName: FontConstant.Almarai_Regular)
           }
       }
}

#Preview {
    NotificationSectionHeader(date: "04 Nov 2023 11:30AM")
}
