//
//  Text + Modifier.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation
import SwiftUI

// MARK: - Text Style Modifiers

/// A custom view modifier that applies a specific text style with font size, color, and style.
///
/// This modifier allows you to style a text element with a specified font size, color, and font style.
/// It ensures that the text is centered and has a consistent appearance across different views.
struct TextStyle: ViewModifier {
    var size: CGFloat          // The size of the text
    var color: Color           // The color of the text
    var fontName: String      // The font style to be applied

    /// Applies the text style to the content.
    ///
    /// - Parameters:
    ///     - content: The view content to which the modifier will be applied.
    /// - Returns: A view with the applied text style.
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: FontSizeManager.scaledFont(size: size))) // Sets the font with the specified size
            .foregroundColor(color)           // Sets the text color
            .multilineTextAlignment(.center)  // Centers the text
    }
}

extension View {
    /// Applies a dynamic text style with customizable font size, color, and style.
    ///
    /// - Parameters:
    ///     - size: The font size (default is 13).
    ///     - color: The color of the text (default is `.primary`).
    ///     - fontStyle: The font style (default is `.interRegular`).
    /// - Returns: A view with the applied text style.
    func textStyle(
        size: CGFloat = 13,
        color: Color = .clr000000,
        fontName: String = FontConstant.Almarai_Regular
    ) -> some View {
        self.modifier(TextStyle(size: size, color: color, fontName: fontName))
    }
}
