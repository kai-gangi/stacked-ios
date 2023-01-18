import SwiftUI

struct ContactView: View {
    
    let library: Library
    
    var body: some View {
        VStack {
            Text("Contact")
                .font(.custom("Inter-Bold", size: 18))
                .foregroundColor(AppColor.libDetailTitle)
                .padding(.bottom, 5)
                    
            if library.refNum != nil {
                Text("Reference:  ")
                    .font(.custom("Inter-Bold", size: 12))
                
                + Text(library.refNum!)
                    .font(.custom("Inter-Regular", size: 12))
            }
            
            if library.circNum != nil {
                Text("Circulation:  ")
                    .font(.custom("Inter-Bold", size: 12))
                
                + Text(library.circNum!)
                    .font(.custom("Inter-Regular", size: 12))
            }
            
            if library.email != nil {
                Text("Email:  ")
                    .font(.custom("Inter-Bold", size: 12))
                
                 + Text(library.email!)
                    .font(.custom("Inter-Regular", size: 12))
            }
        }
        .foregroundColor(AppColor.libDetailText)
    }
}
