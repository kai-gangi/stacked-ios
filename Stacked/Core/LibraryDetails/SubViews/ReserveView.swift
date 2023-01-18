import SwiftUI

struct ReserveView: View {
    
    let library: Library
    
    var body: some View {
        VStack {
            Text("Private Rooms")
                .font(.custom("Inter-Bold", size: 18))
                .foregroundColor(AppColor.libDetailTitle)
                .padding(.bottom, library.name == "Law Library" ? 0 : 5)
            
            if library.name == "Law Library" {
                Text("(Law Students Only)")
                    .font(.custom("Inter-Bold", size: 12))
                    .foregroundColor(AppColor.libDetailText)
                    .padding(.bottom, 5)
            }
            
            ForEach(library.privateRooms) { room in
                Text("\(room.name) (Capacity: \(room.capacity))")
                    .font(.custom("Inter-Regular", size: 12))
                    .foregroundColor(AppColor.libDetailText)
            }
            
            Button {
                if let url = URL(string: library.reserveRoomURL!) {
                    UIApplication.shared.open(url)
                }
            } label: {
                Text("Reserve Room")
                    .font(.custom("Inter-Bold", size: 14))
                    .foregroundColor(AppColor.libDetailText)
            }
            .buttonStyle(.bordered)
            .padding(.bottom, 5)
        }
    }
}
