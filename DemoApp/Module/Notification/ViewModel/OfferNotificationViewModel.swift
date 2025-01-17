//
//  OfferNotificationViewModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 17/01/25.
//

import Foundation

class OfferNotificationViewModel: ObservableObject {
    
    
    @Published var sections: [OfferNotificationData] = [
        OfferNotificationData(
            date: "04 Nov 2023 11:30AM",
            offers: [
                offersData(title: "Lorem ipsum dolor sit amet, consectetur",
                           subTitle: "Proin sodales vehicula sapien, mattis euismod tellus eleifend....",
                           notificationImage: "Placeholder")
                
            ]
        ),
        OfferNotificationData(
            date: "03 Nov 2023 11:30AM",
            offers: [
                offersData(title: "Lorem ipsum dolor sit amet, consectetur",
                           subTitle: "Proin sodales vehicula sapien, mattis euismod tellus eleifend....",
                           notificationImage: "Placeholder"),
                offersData(title: "Lorem ipsum dolor sit amet, consectetur",
                           subTitle: "Proin sodales vehicula sapien, mattis euismod tellus eleifend....",
                           notificationImage: "Placeholder")
                
            ]
        ),
    ]
}
