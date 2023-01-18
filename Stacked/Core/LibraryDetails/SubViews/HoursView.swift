import SwiftUI

struct HoursView: View {
    
    let library: Library
    var timeViewModel = TimeViewModel.shared
    let days = ["Su", "M", "Tu", "W", "Th", "F", "Sa", "Su", "M", "Tu", "W", "Th", "F", "Sa"]
    var dayIndex: Int {
        let day = timeViewModel.loadDay()
        return days.firstIndex(of: day)!
    }
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("Hours")
                .font(.custom("Inter-Bold", size: 18))
                .foregroundColor(AppColor.libDetailTitle)
            
            CustomDisclosureGroup(animation: .easeInOut(duration: 0.2), isExpanded: $isExpanded) {
                isExpanded.toggle()
            } prompt: {
                HStack {
                    Spacer()
                    
                    Image(systemName: "clock")
                        .font(.custom("Inter-Bold", size: 10))

                    Text(timeViewModel.getLibraryHours(library)[dayIndex])
                        .font(.custom("Inter-Bold", size: 12))

                    Image(systemName: "chevron.right")
                        .rotationEffect(isExpanded ? Angle(degrees: 90) : .zero)
                        .font(.custom("Inter-Bold", size: 10))
                    
                    Spacer()
                }
                .foregroundColor(AppColor.libDetailText)
                .padding(.horizontal, 20)
                
            } expandedView: {
                VStack(alignment: .leading) {
                    ForEach(dayIndex+1..<dayIndex+7) { i in
                        HStack {
                            Spacer()
                            
                            Text("\(days[i])  ")
                                .font(.custom("Inter-Bold", size: 12))
                            
                            Text(timeViewModel.getLibraryHours(library)[i])
                                .font(.custom("Inter-Regular", size: 12))

                            
                            Image(systemName: "chevron.right")
                                .hidden()
                            
                            Spacer()
                        }
                    }
                }
                .foregroundColor(AppColor.libDetailText)
            }
            .padding(.bottom, 5)
        }
    }
}
