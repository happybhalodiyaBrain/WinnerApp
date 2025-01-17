//
//  NotificationSectionHeader.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 17/01/25.
//

import SwiftUI

struct NotificationSectionHeader: View {
    let date: String

       var body: some View {
           VStack{
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
