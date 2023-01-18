import SwiftUI

struct LibraryFilterButtonView: View {
    
    @Binding var isSelected: Bool
    @State var details: LibraryFilterDetails
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(isSelected ? Color.red : .gray, lineWidth: 18)
                    .frame(width: 55, height: 55)

                Image(systemName: details.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                    .foregroundColor(isSelected ? Color.red : .gray)
            }
            .padding(.top)
            .padding(.horizontal, 15)
            
            Text(details.label)
                .font(.custom("Inter-Regular", size: 12))
                .foregroundColor(isSelected ? Color.red : .gray)
                .fontWeight(isSelected ? .bold : .semibold)
                .lineLimit(2)
                .frame(height: 40)
                .padding(.top, 10)
        }
    }
}
