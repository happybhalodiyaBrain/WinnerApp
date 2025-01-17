//
//  OfferNotificationViewModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 17/01/25.
//

import Foundation
// MARK: - Offer Notification ViewModel
/// A view model responsible for managing the sections of offer notifications.

class OfferNotificationViewModel: ObservableObject {
    
    // MARK: - Published Properties
       /// A list of sections of offer notifications, each section contains a list of offers.
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
        OfferNotificationData(
            date: "04 Nov 2023 11:30AM",
            offers: [
                offersData(title: "Lorem ipsum dolor sit amet, consectetur",
                           subTitle: "Proin sodales vehicula sapien, mattis euismod tellus eleifend....",
                           notificationImage: "Placeholder")
                
            ]
        ),
        OfferNotificationData(
            date: "04 Feb 2021 01:30PM",
            offers: [
                offersData(title: "Lorem ipsum dolor sit amet, consectetur",
                           subTitle: "Proin sodales vehicula sapien, mattis euismod tellus eleifend....",
                           notificationImage: "Placeholder"),
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
