import SwiftUI

struct LibraryCellView: View {
    
    var library: Library
    @ObservedObject private var favoritesManager = LibraryFavoritesViewModel.shared
    @ObservedObject private var mapViewModel = MapViewModel.shared
    @ObservedObject private var timeViewModel = TimeViewModel.shared
    
    var body: some View {
        HStack {
            Image(library.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipped()
                .cornerRadius(10)
                .padding(.vertical, 10)
        
            VStack(alignment: .leading) {
                HStack {
                    Text(library.name)
                        .font(.custom("Inter-Regular", size: 18))
                        .bold()
                        .lineLimit(1)
         
                    if favoritesManager.contains(library) {
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15)
                            .foregroundColor(.yellow)
                            .padding(.trailing)
                    }
                }
                .frame(height: 15)
                
                Text("")
                    .font(.custom("Inter-Regular", size: 12))
                    .padding(.bottom, 28)
                    .hidden()

                let openingStatus = timeViewModel.openingStatusLib(library).components(separatedBy: " ").first!
                let openingStatusColor = timeViewModel.openingStatusColorLib(library)
                let openingStatusSuffix = timeViewModel.openingStatusSuffix(library)
                
                Text(openingStatus)
                    .font(.custom("Inter-Regular", size: 12))
                    .foregroundColor(openingStatusColor)
                    .bold()
                
                + Text(openingStatusSuffix)
                    .font(.custom("Inter-Regular", size: 12))
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 7)
        }
    }
}
