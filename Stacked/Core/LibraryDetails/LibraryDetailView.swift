import SwiftUI
import MapKit

struct LibraryDetailView: View {

    let library: Library
    @ObservedObject private var timeViewModel = TimeViewModel.shared
    @ObservedObject private var favoritesManager = LibraryFavoritesViewModel.shared
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            GeometryReader { reader in
                Image(library.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -reader.frame(in: .global).minY)
                    .frame(width: UIScreen.main.bounds.width, height: reader.frame(in : .global).minY + 200)
            }
            .frame(height: 200)
            
            VStack {
                ZStack {
                    Rectangle()
                        .cornerRadius(20)
                        .foregroundColor(.white)

                    VStack {
                        TitleView(library: library)
                        
                        Divider()
                        
                        HoursView(library: library)
                                                
                        Divider()
                        
                        AmenityView(amenity: library.amenities)
                        
                        if timeViewModel.getServiceHours(library).count > 0 {
                            Divider()
                            
                            ServicesView(library: library)
                        }
                        
                        if library.privateRooms.count > 0 {
                            Divider()
                            
                            ReserveView(library: library)
                        }
                        
                        Divider()
                        
                        ContactView(library: library)
                    }
                }
                .offset(y: -15)
            }
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
