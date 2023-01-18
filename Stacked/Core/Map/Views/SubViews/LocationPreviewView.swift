import SwiftUI
import MapKit

struct LocationPreviewView: View {

    @EnvironmentObject private var mapViewModel: MapViewModel
    let library: Library

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }

            VStack(spacing: 8) {
                learnMoreButton
                directionsButton
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        Image(library.image)
            .resizable()
            .frame(width: 100, height: 100)
            .scaledToFill()
            .cornerRadius(10)
            .padding(6)
            .background(Color.white)
            .cornerRadius(10)
    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(library.name)
                .font(.custom("Inter-Bold", size: 22))
                .fontWeight(.bold)

            Text(library.address)
                .font(.custom("Inter-Regular", size: 16))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var learnMoreButton: some View {
        NavigationLink {
            LibraryDetailView(library: library)
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var directionsButton: some View {
        Button {
            let latitude: CLLocationDegrees = Double(library.coordinates.latitude)
            let longitude: CLLocationDegrees = Double(library.coordinates.longitude)
            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span),
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = library.name
            mapItem.openInMaps(launchOptions: options)
        } label: {
            VStack {
                Text("Directions")
                    .font(.headline)
                    .frame(width: 125, height: 30)
            }
        }
        .buttonStyle(.bordered)
    }
}
