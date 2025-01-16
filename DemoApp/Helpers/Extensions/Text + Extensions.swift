//
//  Text + Extensions.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation
import SwiftUI

extension Text {
    func headerTextStyle() -> some View {
        self.textStyle(size: 14, color: Color(UIColor.appclr000000),
                   fontName: FontConstant.Almarai_Bold)
    }
    
    
    func listTextStyle() -> some View  {
        self
            .textStyle(size: 14, color: Color(UIColor.appclr000000),
                       fontName: FontConstant.Almarai_Regular) as! Text
    }
    
    func smallTextStyle() -> some View {
        self
            .textStyle(size: 10, color: Color(UIColor.appclr707070),
                       fontName: FontConstant.Almarai_Regular) as! Text
    }
    
    func titleTextStyle() -> some View  {
        self
            .textStyle(size: 14, color: Color(UIColor.appclr707070),
                       fontName: FontConstant.Almarai_Bold) as! Text
    }
}
