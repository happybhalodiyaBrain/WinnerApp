//
//  OfferNotificationData.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 17/01/25.
//

import Foundation

struct OfferNotificationData : Identifiable {
    
    let id = UUID() // Unique identifier for the section
    let date: String
    let offers: [offersData]
    
}

struct offersData: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    let notificationImage: String 
}
