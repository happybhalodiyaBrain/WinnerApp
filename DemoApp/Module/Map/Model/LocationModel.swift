//
//  Location.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation
import MapKit
import CoreLocation

struct LocationModel: Identifiable, Equatable {
    
    // MARK: - Properties
    /// Unique identifier for the location.
    let id = UUID()
    /// The name of the location (e.g., "Sabarmati Ashram").
    let name: String
    /// The address of the location.
    let address: String
    /// The phone number of the location.
    let phone: String
    /// The geographic coordinates (latitude, longitude) of the location.
    let coordinate: CLLocationCoordinate2D
    
    // Conform to Equatable by comparing the coordinates
     static func == (lhs: LocationModel, rhs: LocationModel) -> Bool {
         return lhs.coordinate.latitude == rhs.coordinate.latitude &&
                lhs.coordinate.longitude == rhs.coordinate.longitude
     }
}
