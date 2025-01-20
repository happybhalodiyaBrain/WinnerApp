import Foundation
import SwiftUI

struct CommonButton: View {
    // MARK: - Properties
    /// The title text displayed on the button.
    let title: String
    /// The action that is triggered when the button is tapped.
    let action: () -> Void
    /// The background color of the button. Default is dark blue.
    var backgroundColor: Color = Color(UIColor.appclr0A195C)
    /// The color of the text on the button. Default is white.
    var textColor: Color = Color(UIColor.appclrFFFFFF)
    /// The corner radius of the button. Default is 8.
    var cornerRadius: CGFloat = 8
    /// The horizontal padding around the button content. Default is 16.
    var horizontalPadding: CGFloat = 16
    /// The vertical padding around the button content. Default is 16.
    var verticalPadding: CGFloat = 16
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            action() // Trigger the provided action when the button is tapped
        }) {
            // Button label: Text with customized style
            Text(title)
                .textStyle(size: 16, color: Color(UIColor.appclrFFFFFF),
                           fontName: FontConstant.Almarai_Bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.bottom, verticalPadding)
    }
}
