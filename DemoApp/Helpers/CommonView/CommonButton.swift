import Foundation
import SwiftUI

struct CommonButton: View {
    // MARK: - Properties
    let title: String
    let action: () -> Void
    var backgroundColor: Color = Color(UIColor.appclr0A195C)
    var textColor: Color = Color(UIColor.appclrFFFFFF)
    var cornerRadius: CGFloat = 8
    var horizontalPadding: CGFloat = 16
    var verticalPadding: CGFloat = 16
    
    var body: some View {
        Button(action: {
            action()
        }) {
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
