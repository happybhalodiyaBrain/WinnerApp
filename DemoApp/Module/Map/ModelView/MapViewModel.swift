//
//  MapViewModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 20/01/25.
//

import Foundation
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 23.033863, longitude: 72.554700), // Default location
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    @Published var stores: [LocationModel] = [
        LocationModel(
            name: "Sabarmati Riverfront",
            address: "Ahmedabad, Gujarat",
            phone: "1234567890",
            coordinate: CLLocationCoordinate2D(latitude: 23.033863, longitude: 72.554700)
        ),
        LocationModel(
            name: "Manek Chowk",
            address: "Ahmedabad, Gujarat",
            phone: "0987654321",
            coordinate: CLLocationCoordinate2D(latitude: 23.026202, longitude: 72.588653)
        ),
        LocationModel(
            name: "Kankaria Lake",
            address: "Ahmedabad, Gujarat",
            phone: "1122334455",
            coordinate: CLLocationCoordinate2D(latitude: 22.992998, longitude: 72.603007)
        ),
        LocationModel(
            name: "Science City",
            address: "Ahmedabad, Gujarat",
            phone: "5566778899",
            coordinate: CLLocationCoordinate2D(latitude: 23.079393, longitude: 72.510564)
        )
    ]
    
   
}
