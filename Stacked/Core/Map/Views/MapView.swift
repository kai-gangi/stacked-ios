import SwiftUI
import MapKit
import CoreLocationUI

struct MapView: View {
    
    @EnvironmentObject var mapViewModel: MapViewModel
    @State private var viewDidLoad = false
    
    var body: some View {
        NavigationView {
            ZStack {
                map
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        ForEach(mapViewModel.libraries) { library in
                            if mapViewModel.selectedLocation == library {
                                LocationPreviewView(library: library)
                                    .shadow(color: Color.black.opacity(0.3), radius: 20)
                                    .padding()
                                    .transition(
                                        .asymmetric(
                                                insertion: .move(edge: .trailing),
                                                removal: .move(edge: .leading)
                                        )
                                    )
                            }
                        }
                    }
                }
                

            }
        }
    }
}

extension MapView {
    private var map: some View {
        Map(
            coordinateRegion: $mapViewModel.region,
            showsUserLocation: true,
            annotationItems: mapViewModel.libraries,
            annotationContent: { library in
                MapAnnotation(coordinate: library.coordinates) {
                    LocationMapAnnotationView(library: library)
                        .onTapGesture {
                            mapViewModel.showNextLocation(library: library)
                        }
                        .scaleEffect(mapViewModel.selectedLocation == library ? 1.25 : 0.7)

                }
            }
        )
        .ignoresSafeArea()
        .accentColor(Color(.systemPink))
        .onAppear {
            if viewDidLoad == false {
                mapViewModel.checkIfLocationServicesIsEnabled()
                viewDidLoad = true
            }
        }
    }
}
