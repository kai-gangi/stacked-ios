import Foundation
import MapKit
import SwiftUI

enum MapDetails {
    static let defaultLocation = CLLocationCoordinate2D(latitude: 42.447617110480515, longitude: -76.48275475940764)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.0075, longitudeDelta: 0.0075)
}

final class MapViewModel: NSObject, ObservableObject {
    
    static var shared = MapViewModel()

    @Published var userLocation: CLLocation?
    @Published var region = MKCoordinateRegion(
        center: MapDetails.defaultLocation,
        span: MapDetails.defaultSpan
    )
    @Published var locationSelected: Library?
    private var hasSetRegion = false
    private var locationManager: CLLocationManager?
    
    @Published var showLocationsList: Bool = false
    @Published var libraries: [Library]
    @Published var selectedLocation: Library? {
        didSet {
            updateMapRegion(location: selectedLocation!.coordinates)
        }
    }
    @Published var userDistances = [String: String]()

    override init() {
        self.libraries = LibraryList.libraries
        super.init()
    }
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager!.requestWhenInUseAuthorization()
            locationManager!.startUpdatingLocation()
        } else {
            print("Alert: turn location services on ")
        }
    }
    
    private func checkLocationAuthorization() {
        
        guard let locationManager = self.locationManager else { return }
    
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(
                center: locationManager.location!.coordinate,
                span: MapDetails.defaultSpan
            )
        @unknown default:
            break
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(library: Library) {
        withAnimation(.easeInOut) {
            selectedLocation = library
            showLocationsList = false
        }
    }
    
    private func updateMapRegion(location: CLLocationCoordinate2D) {
        withAnimation(.easeInOut) {
            region = MKCoordinateRegion(
                center: location,
                span: MapDetails.defaultSpan
            )
        }
    }
}

extension MapViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else { return }
        
        if !hasSetRegion {
            self.updateMapRegion(location: userLocation.coordinate)
            hasSetRegion = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
