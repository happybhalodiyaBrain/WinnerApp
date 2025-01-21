//
//  Location.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation
import MapKit
import CoreLocation

struct LocationModel: Identifiable {
    let id = UUID()
       let name: String
       let address: String
       let phone: String
       let coordinate: CLLocationCoordinate2D
}
