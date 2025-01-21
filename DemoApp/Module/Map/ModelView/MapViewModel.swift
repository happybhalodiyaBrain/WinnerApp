import Foundation
import MapKit
import CoreLocation

/// ViewModel responsible for managing map-related data such as region, user location, and stores.

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    // MARK: - Properties
    private var locationManager: CLLocationManager?  // CLLocationManager instance for getting user location.
    
    /// The region currently displayed on the map (center and zoom level)
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.335480, longitude: -121.893028), // Default location
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    /// The current location of the user.
    @Published var userLocation: CLLocationCoordinate2D?
    
    /// A list of predefined stores with their location details for map annotations.
    @Published var stores: [LocationModel] = [
        LocationModel(
            name: "Downtown San Jose",
            address: "San Jose, California",
            phone: "1234567890",
            coordinate: CLLocationCoordinate2D(latitude: 37.432335, longitude: -121.899574)
        ),
        LocationModel(
            name: "Milpitas, CA",
            address: "San Jose, California",
            phone: "0987654321",
            coordinate: CLLocationCoordinate2D(latitude: 37.354107, longitude: -121.955238)
        ),
        LocationModel(
            name: "Santa Clara, CA",
            address: "San Jose, California",
            phone: "1122334455",
            coordinate: CLLocationCoordinate2D(latitude: 37.368830, longitude: -122.036350)
        ),
        LocationModel(
            name: "Sunnyvale, CA",
            address: "San Jose, California",
            phone: "1122334455",
            coordinate: CLLocationCoordinate2D(latitude: 37.368830, longitude: -122.036350)
        ),
        LocationModel(
            name: "Mountain View, CA",
            address: "San Jose, California",
            phone: "1122334455",
            coordinate: CLLocationCoordinate2D(latitude: 37.386051, longitude: -122.083855)
        ),
        
    ]
    
    // MARK: - Initialization
    override init() {
        // Default region is set for a different location. This could be customized further.
        self.region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 23.033863, longitude: 72.554700), // Default region
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
        super.init()
        setupLocationManager()
    }
    
    // MARK: - Private Methods
    /// Sets up the location manager to fetch user's location.
    private func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManager Delegate Methods
    /// Called when the user's location is updated.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            DispatchQueue.main.async {
                self.userLocation = location.coordinate
                self.region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                )
            }
        }
    }
    
    // MARK: - Public Methods
    /// Manually set the user's location for testing purposes.
    func setManualLocation(latitude: Double, longitude: Double) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.userLocation = coordinate
        self.region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}
