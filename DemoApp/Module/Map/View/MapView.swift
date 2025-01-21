
import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    @StateObject private var viewModel = MapViewModel()
    
    
    var body: some View {
        
        VStack{
            CustomHeader(greetingText: Header.findaStore, onBackTapped: {}, showRightButtons: true, showBackButton : true, cartBadgeCount: 3)
            
            ZStack{
                Map(coordinateRegion: $viewModel.region,
                    showsUserLocation: true,
                    annotationItems: viewModel.stores) { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack(spacing: 4) {
                            Image(Icons.ic_locationPin.rawValue)
                                .frame(width: 37, height: 47)
                            
                        }
                    }
                }
                
            }
        }
        Spacer()
    }
}


#Preview {
    MapView()
}
