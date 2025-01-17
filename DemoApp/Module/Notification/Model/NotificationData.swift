//
//  NotificationData.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 17/01/25.
//

import Foundation

// MARK: - Notification Data Model
/// A struct representing the data model for a notification.
struct NotificationData : Identifiable {
    // MARK: - Properties
    let id = UUID()
    let title : String
    let datetime : String
    let notificationImage: String
    let description: String
    let isRead : Bool
    
}
