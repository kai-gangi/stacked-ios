import SwiftUI

struct LibraryFiltersView: View {
    
    @ObservedObject private var libraryFiltersViewModel = LibraryFiltersViewModel.shared
    @State private var isSelected = [Bool](repeating: false, count: LibraryFiltersViewModel.FilterType.allCases.count)    

    var body: some View {
        VStack(alignment: .leading) {
            Text("Filter By")
                .font(.custom("Inter-Light", size: 12))
                .foregroundColor(.secondary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(libraryFiltersViewModel.filterButtonTypes, id: \.self) { filter in
                        let buttonIndex = libraryFiltersViewModel.filterTypes.firstIndex(of: filter)!
                        
                        Button {
                            isSelected[buttonIndex].toggle()
                            
                            if buttonIndex == 1 {
                                libraryFiltersViewModel.nearestFirstSelected.toggle()
                            }
                            
                            if isSelected[buttonIndex] {
                                libraryFiltersViewModel.updateFilteredLibraries(filter)
                                isSelected = [Bool](repeating: false, count: LibraryFiltersViewModel.FilterType.allCases.count)
                                isSelected[buttonIndex] = true
                            }
                            
                            if !isSelected.contains(true) {
                                libraryFiltersViewModel.updateFilteredLibraries(.none)
                            }
                            
                            HapticManager.instance.impact(style: .soft)
                        } label: {
                            LibraryFilterButtonView(isSelected: $isSelected[buttonIndex], details: LibraryFilterDetails(filter))
                        }
                    }
                }
            }
        }
    }
}

