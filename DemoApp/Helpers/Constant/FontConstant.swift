//
//  FontConstant.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation

// MARK: - Global Device Constants
/// Global size constants for device screen dimensions, to be used across the app.
var designSize: CGSize = CGSize(width: 375.0, height: 812.0) // size as per xd
var deviceScreenSize: CGSize = CGSize(width: 375.0, height: 812.0) // 15 pro
var geometryHeight = deviceScreenSize.height // Global Height Constant of GeometryReader to use throught App
var geometryWidth = deviceScreenSize.width // Global Width Constant of GeometryReader to use throught App


// MARK: - Function to Calculate Scaled Size
/// Function to calculate the scaled size for UI elements based on the design and device screen size.
///
/// - Parameters:
///   - xdWidth: The width of the element in the design (XD file).
///   - xdHeight: The height of the element in the design (XD file).
/// - Returns: The scaled size for the element based on the device's screen size
func calculateScaledSize(xdWidth: CGFloat, xdHeight: CGFloat) -> CGSize {
    // Calculate scaling factor based on width
    let scaleFactorWidth = deviceScreenSize.width / designSize.width
    
    // Scale the image dimensions proportionally
    let scaledWidth = xdWidth * scaleFactorWidth
    let scaledHeight = xdHeight * scaleFactorWidth // Maintaining aspect ratio using width scaling
    
    return CGSize(width: scaledWidth, height: scaledHeight)
}
// MARK: - Font Constants
/// A struct containing the font names used in the app for consistency.
struct FontConstant {
    static let Almarai_Bold = "Almarai-Bold"
    static let Almarai_ExtraBold = "Almarai-ExtraBold"
    static let Almarai_Light = "Almarai-Light"
    static let Almarai_Regular = "Almarai-Regular"
    static let OpenSans_Condensed_SemiBold = "OpenSans_Condensed-SemiBold"
}

// MARK: - Font Size Manager
/// A struct for calculating scaled font sizes based on the device screen size.
/// This ensures that fonts are properly adjusted for different screen sizes.
struct FontSizeManager {
    /// Scales a given font size proportionally based on the device's screen size.
    ///
    /// - Parameter size: The font size from the design (XD file).
    /// - Returns: The scaled font size based on the device's screen size.
    static func scaledFont(size: CGFloat) -> CGFloat {
        let widthFactor = deviceScreenSize.width / designSize.width
        let heightFactor = deviceScreenSize.height / designSize.height
        let scaleFactor = min(widthFactor, heightFactor) // Maintain aspect ratio
        return max(size * scaleFactor, size * 0.8) // Avoid excessive shrinking
    }
}
