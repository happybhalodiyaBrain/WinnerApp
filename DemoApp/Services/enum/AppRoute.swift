//
//  AppRoute.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation

/// Represents the possible navigation routes in the application.
enum AppRoutes: Hashable {
    // MARK: - Routes
       
    /// Route to the winner list screen.
    case winnerList
    
    /// Route to the winner details screen.
    case winnerDetails
    
    /// Route to the notification screen.
    case notification
    
    /// Route to Order and Return form
    case orderAndReturn
}
