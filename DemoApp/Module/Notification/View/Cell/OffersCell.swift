//
//  NotificationCellView.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 17/01/25.
//

import SwiftUI

struct OffersCell: View {
    let notification: offersData
    
    var body: some View {
       
            
           
            VStack(alignment: .leading) {
                // Title
                Text(notification.title)
                    .textStyle(size: 14,
                               color: Color(UIColor.appclr000000),
                               fontName: FontConstant.Almarai_Bold)
                
                // Description
                Text(notification.subTitle)
                    .textStyle(size: 12,
                               color: Color(UIColor.appclr92949F),
                               fontName: FontConstant.Almarai_Regular)
                    .padding(.top, 2)
                
                // Notification Image
                Image(Icons.rectImage.rawValue)
                    .resizable()
                    .frame(width:.infinity, height: 127)
                    .cornerRadius(4)
                    .padding(.top, 10)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(UIColor.appclrDDDDDD))
                )
            
        
    }
}

#Preview {
    OffersCell(notification: offersData(title: "Lorem ipsum dolor sit amet, consectetur",
                                                  subTitle: "Proin sodales vehicula sapien, mattis euismod tellus eleifend....",
                                                  notificationImage: "Placeholder"))
}
