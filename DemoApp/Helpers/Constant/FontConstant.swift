//
//  FontConstant.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation

var designSize: CGSize = CGSize(width: 375.0, height: 812.0) // size as per figma
var deviceScreenSize: CGSize = CGSize(width: 375.0, height: 812.0) // 15 pro
var geometryHeight = deviceScreenSize.height // Global Height Constant of GeometryReader to use throught App
var geometryWidth = deviceScreenSize.width // Global Width Constant of GeometryReader to use throught App

struct FontConstant {
    static let Almarai_Bold = "Almarai-Bold"
    static let Almarai_ExtraBold = "Almarai-ExtraBold"
    static let Almarai_Light = "Almarai-Light"
    static let Almarai_Regular = "Almarai-Regular"
}

struct FontSizeManager {
    static func scaledFont(size: CGFloat) -> CGFloat {
        let widthFactor = deviceScreenSize.width / designSize.width
        let heightFactor = deviceScreenSize.height / designSize.height
        let scaleFactor = min(widthFactor, heightFactor) // Maintain aspect ratio
        return max(size * scaleFactor, size * 0.8) // Avoid excessive shrinking
    }
}
