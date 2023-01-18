import SwiftUI

struct AmenityView: View {
    
    let amenity: Amenity
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("Amenities")
                .font(.custom("Inter-Bold", size: 18))
                .foregroundColor(AppColor.libDetailTitle)
            
            LazyVGrid(columns: [GridItem(.flexible(), alignment: .trailing), GridItem(.flexible(), alignment: .leading)]) {
                if amenity.getSpaces().count > 0 {
                    Text("Spaces: ")
                        .font(.custom("Inter-Bold", size: 12))
                        .foregroundColor(AppColor.libDetailText)
                    
                    ForEach(amenity.getSpaces(), id: \.self) { space in
                        Text("\(space)")
                            .font(.custom("Inter-Regular", size: 12))
                            .foregroundColor(AppColor.libDetailText)
                            .padding(.trailing)
                        
                        Text("")
                    }
                    
                    Text("")
                }
                
                if amenity.getTechnology().count > 0 {
                    Text("Technology: ")
                        .font(.custom("Inter-Bold", size: 12))
                        .foregroundColor(AppColor.libDetailText)
                    
                    ForEach(amenity.getTechnology(), id: \.self) { tech in
                        Text("\(tech)")
                            .font(.custom("Inter-Regular", size: 12))
                            .foregroundColor(AppColor.libDetailText)
                            .padding(.trailing)
                        
                        Text("")
                    }
                    
                    Text("")
                }
                
                if amenity.getCollections().count > 0 {
                    Text("Collections: ")
                        .font(.custom("Inter-Bold", size: 12))
                        .foregroundColor(AppColor.libDetailText)
                    
                    ForEach(amenity.getCollections(), id: \.self) { col in
                        Text("\(col)")
                            .font(.custom("Inter-Regular", size: 12))
                            .foregroundColor(AppColor.libDetailText)
                            .padding(.trailing)
                        
                        Text("")
                    }
                    
                    Text("")
                }
            }
        }
    }
}
