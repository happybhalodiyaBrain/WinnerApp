import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    // MARK: - State Variables
    @StateObject private var viewModel = MapViewModel()  // ViewModel for managing map data
    @State private var selectedLocation: LocationModel? // Track selected location for details
    @State private var showLocationDetails = false // Flag to toggle visibility of location details

    var body: some View {
        VStack {
            
            // MARK: - Custom Header
            CustomHeader(
                greetingText: Header.findaStore,
                onBackTapped: {},
                showRightButtons: false,
                showBackButton: true,
                cartBadgeCount: 3,
                isShowingFiler: true
            )
            
            ZStack {
                // MARK: - Main Map View
                Map(coordinateRegion: $viewModel.region,
                    showsUserLocation: true,
                    annotationItems: viewModel.stores) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        Button(action: {
                            selectedLocation = location
                            showLocationDetails = true
                        }) {
                            Image(Icons.ic_locationPin.rawValue)
                                .resizable()
                                .frame(width: selectedLocation == location ? 37 : 28,
                                       height: selectedLocation == location ? 47 : 35)
                        }
                    }
                }
                .onAppear {
                    // Set initial map location when view appears ( testing purpose only static)
                    viewModel.setManualLocation(latitude: 37.335480, longitude: -121.893028)
                }
                .edgesIgnoringSafeArea(.bottom)

                // MARK: - Location Details Overlay
                if showLocationDetails, let location = selectedLocation {
                    VStack {
                        Spacer()
                        LocationDetails(location: location) {
                            selectedLocation = nil
                            showLocationDetails = false
                        }
                    }.padding(.bottom, 16)
                }
            }
        }
    }
}

#Preview {
    MapView()
}


