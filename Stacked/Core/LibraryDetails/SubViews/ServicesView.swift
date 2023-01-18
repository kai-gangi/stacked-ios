import SwiftUI

struct ServicesView: View {
    
    let library: Library
    var timeViewModel = TimeViewModel.shared
    let days = ["Su", "M", "Tu", "W", "Th", "F", "Sa", "Su", "M", "Tu", "W", "Th", "F", "Sa"]
    var dayIndex: Int {
        let day = timeViewModel.loadDay()
        return days.firstIndex(of: day)!
    }
    
    @State private var isExpanded = false
    
    var body: some View {
        CustomDisclosureGroup(animation: .easeInOut(duration: 0.2), isExpanded: $isExpanded) {
            isExpanded.toggle()
        } prompt: {
            HStack {
                Spacer()
                
                Text("Services (\(library.services.count))")
                    .font(.custom("Inter-Bold", size: 18))
                    .foregroundColor(AppColor.libDetailTitle)
                
                Image(systemName: "chevron.right")
                    .rotationEffect(isExpanded ? Angle(degrees: 90) : .zero)
                    .font(.custom("Inter-Bold", size: 10))
                
                Spacer()
            }
            .padding(.bottom, 5)
        } expandedView: {
            ForEach(LibraryList.servicesDict[library.name]!, id: \.self)  { service in
                VStack {
                    Text(service)
                        .font(.custom("Inter-Bold", size: 12))
                        .foregroundColor(AppColor.libDetailText)
                        .padding(.bottom, 3)
                    
                    let hours = timeViewModel.getServiceHours(library)[service]
                    ForEach(dayIndex..<dayIndex+6) { i in
                        HStack {
                            Spacer()
                            
                            Text("\(days[i])  ")
                                .font(.custom("Inter-Bold", size: 12))
                            
                            Text(hours![i])
                                .font(i == dayIndex ?
                                    .custom("Inter-Bold", size: 12)
                                    : .custom("Inter-Regular", size: 12))
                            
                            Image(systemName: "chevron.right")
                                .hidden()
                            
                            Spacer()
                        }
                    }
                }
                .padding(.bottom)
            }
            .foregroundColor(AppColor.libDetailText)
        }
    }
}
