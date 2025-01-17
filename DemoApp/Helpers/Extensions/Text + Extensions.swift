//
//  Text + Extensions.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation
import SwiftUI

/// Extension for `Text` to provide reusable text styles in the app.
extension Text {
    /// Applies a header text style to the `Text` view.
    func headerTextStyle() -> some View {
        self.textStyle(size: 20, color: Color(UIColor.appclr000000),
                   fontName: FontConstant.Almarai_Bold)
    }
    /// Applies a list item text style to the `Text` view.
    func listTextStyle() -> some View  {
        self
            .textStyle(size: 14, color: Color(UIColor.appclr000000),
                       fontName: FontConstant.Almarai_Regular)
    }
    /// Applies a small text style to the `Text` view.
    func smallTextStyle() -> some View {
        self
            .textStyle(size: 10, color: Color(UIColor.appclr707070),
                       fontName: FontConstant.Almarai_Regular)
    }
    /// Applies a title text style to the `Text` view.
    func titleTextStyle() -> some View  {
        self
            .textStyle(size: 14, color: Color(UIColor.appclr707070),
                       fontName: FontConstant.Almarai_Bold) 
    }
}
