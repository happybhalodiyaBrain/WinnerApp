//
//  NotificationData.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 17/01/25.
//

import Foundation

struct NotificationData : Identifiable {
   
    let id = UUID()
    let title : String
    let datetime : String
    let notificationImage: String
    let description: String
    let isRead : Bool
    
}
