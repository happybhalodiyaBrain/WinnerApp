//
//  NotificationViewModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 17/01/25.
//

import Foundation
// MARK: - Notification ViewModel

class NotificationViewModel: ObservableObject {
    
    // MARK: - Published Properties
    /// The list of notifications to be displayed in the app.
    @Published var notificationList: [NotificationData] = [
        NotificationData(
            title: "Lorem ipsum dolor sit amet, consectetur",
            datetime: "04 Nov 2023 11:30AM",
            notificationImage: "Placeholder_image",
            description: "Proin sodales vehicula sapien, mattis euismod tellus eleifend sed. Interdum et malesuada fames ac ante...",
            isRead: false
        ),
        NotificationData(
            title: "Lorem ipsum dolor sit amet, consectetur",
            datetime: "03 Nov 2023 11:30AM",
            notificationImage: "Placeholder_image",
            description: "Proin sodales vehicula sapien, mattis euismod tellus eleifend sed. Interdum et malesuada fames ac ante...",
            isRead: true
        ),
        NotificationData(
            title: "Lorem ipsum dolor sit amet, consectetur",
            datetime: "02 Nov 2023 11:30AM",
            notificationImage: "Placeholder_image",
            description: "Proin sodales vehicula sapien, mattis euismod tellus eleifend sed. Interdum et malesuada fames ac ante...",
            isRead: true
        ),
        NotificationData(
            title: "Lorem ipsum dolor sit amet, consectetur",
            datetime: "02 Nov 2023 11:30AM",
            notificationImage: "Placeholder_image",
            description: "Proin sodales vehicula sapien, mattis euismod tellus eleifend sed. Interdum et malesuada fames ac ante...",
            isRead: false
        ),
        NotificationData(
            title: "Lorem ipsum dolor sit amet, consectetur",
            datetime: "04 Nov 2023 11:30AM",
            notificationImage: "Placeholder_image",
            description: "Proin sodales vehicula sapien, mattis euismod tellus eleifend sed. Interdum et malesuada fames ac ante...",
            isRead: true
        ),
        NotificationData(
            title: "Lorem ipsum dolor sit amet, consectetur",
            datetime: "04 Nov 2023 11:30AM",
            notificationImage: "Placeholder_image",
            description: "Proin sodales vehicula sapien, mattis euismod tellus eleifend sed. Interdum et malesuada fames ac ante...",
            isRead: true
        ),
        
    ]
}

