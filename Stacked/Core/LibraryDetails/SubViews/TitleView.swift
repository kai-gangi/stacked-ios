import SwiftUI
import MapKit

struct TitleView: View {
    
    let library: Library
    @State private var isExpanded = false

    @ObservedObject private var favoritesViewModel = LibraryFavoritesViewModel.shared
    @ObservedObject var timeViewModel = TimeViewModel.shared
    @ObservedObject private var mapViewModel = MapViewModel.shared
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                        .padding(.leading)
                }
                
                Spacer()
                
                Button {
                    if favoritesViewModel.contains(library) {
                        favoritesViewModel.remove(library)
                    } else {
                        favoritesViewModel.add(library)
                    }
                } label: {
                    Image(systemName: favoritesViewModel.contains(library) ? "star.fill" : "star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(favoritesViewModel.contains(library) ? .yellow : .secondary)
                        .padding(.trailing)
                }
            }
            
            VStack(alignment: .center, spacing: 8) {
                Text(library.name)
                    .font(.custom("Inter-Bold", size: 18))
                    .foregroundColor(AppColor.libDetailTitle)
                    .padding(.top)
                
                let openingStatus = timeViewModel.openingStatusLib(library)
                let openingStatusColor = timeViewModel.openingStatusColorLib(library)
                
                HStack {
                    Text(openingStatus)
                        .foregroundColor(openingStatusColor)
                        .bold()
                    
                    Text(" | ")
                    
                    Text("\(library.address)")
                        .foregroundColor(.pink)
                        .underline()
                        .onTapGesture {
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
                        }
                }
                .font(.custom("Inter-Regular", size: 12))
                .foregroundColor(AppColor.libDetailText)
                .padding(.bottom, 5)
            }
        }
    }
}
