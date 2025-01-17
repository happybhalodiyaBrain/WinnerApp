//
//  OfferNotificationData.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 17/01/25.
//

import Foundation

// MARK: - Offer Notification Data Model
/// A struct representing the data model for a section of offer notifications.
struct OfferNotificationData : Identifiable {
    // MARK: - Properties
    
    let id = UUID() // Unique identifier for the section
    let date: String
    let offers: [offersData]
    
}

// MARK: - Offers Data Model
/// A struct representing the data model for individual offers within a notification section.
struct offersData: Identifiable {
    // MARK: - Properties
    
    let id = UUID()
    let title: String
    let subTitle: String
    let notificationImage: String
}
