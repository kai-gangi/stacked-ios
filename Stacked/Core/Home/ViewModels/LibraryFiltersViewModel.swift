import Foundation

final class LibraryFiltersViewModel: ObservableObject {
    enum FilterType: CaseIterable {
        case none, alwaysOpen, hasPrinters, hasGroupStudy, hasStudyRooms, hasCafe, hasLaptopLoans, hasPublicWorkstations
    }
    
    static var shared = LibraryFiltersViewModel()
    let mapViewModel = MapViewModel()
    let libraries: [Library] = LibraryList.libraries
    let filterTypes: [FilterType]
    let filterButtonTypes: [FilterType]
    var filterLabel: String = ""
    @Published var nearestFirstSelected = false
    @Published var filteredLibraries: [Library] = LibraryList.libraries
    
    init() {
        let allFilters = FilterType.allCases
        self.filterTypes = allFilters
        self.filterButtonTypes = allFilters.filter { $0 != .none }
    }
    
    func updateFilteredLibraries(_ filter: FilterType) {
        switch filter {
        case .none:
            self.filteredLibraries = libraries
        case .alwaysOpen:
            self.filteredLibraries = libraries.filter { $0.amenities.isAlwaysOpen }
        case .hasPrinters:
            self.filteredLibraries = libraries.filter { $0.amenities.hasPrinters }
        case .hasGroupStudy:
            self.filteredLibraries = libraries.filter { $0.amenities.groupStudy }
        case .hasStudyRooms:
            self.filteredLibraries = libraries.filter { $0.amenities.hasStudyRooms }
        case .hasCafe:
            self.filteredLibraries = libraries.filter { $0.amenities.hasCafe
            }
        case .hasLaptopLoans:
            self.filteredLibraries = libraries.filter {
                $0.amenities.laptopLoansApple || $0.amenities.laptopLoansWindows
            }
        case .hasPublicWorkstations:
            self.filteredLibraries = libraries.filter {
                $0.amenities.hasPublicWorkstations
            }
        }
    }
}
