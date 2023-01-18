import SwiftUI

struct AppColor {
    static let libDetailTitle = Color(red: 72/255, green: 72/255, blue: 72/255)
    static let libDetailText = Color(red: 118/255, green: 118/255, blue: 118/255)
    static let red = Color(red: 239/255, green: 64/255, blue: 53/255)
}

struct LibraryFilterDetails {
    
    let filter: LibraryFiltersViewModel.FilterType
    var label: String
    var icon: String
    
    init(_ filter: LibraryFiltersViewModel.FilterType) {
        self.filter = filter
        
        switch filter {
        case .none:
            self.label = ""
            self.icon = ""
        case .alwaysOpen:
            self.label = "24/7 Study\nSpace"
            self.icon = "clock"
        case .hasPrinters:
            self.label = "Printers\n"
            self.icon = "printer"
        case .hasGroupStudy:
            self.label = "Group\nStudy"
            self.icon = "person.3.fill"
        case .hasStudyRooms:
            self.label = "Study\nRooms"
            self.icon = "studentdesk"
        case .hasCafe:
            self.label = "Cafe\n"
            self.icon = "cup.and.saucer.fill"
        case .hasLaptopLoans:
            self.label = "Laptop\nLoans"
            self.icon = "laptopcomputer"
        case .hasPublicWorkstations:
            self.label = "Public\nWorkstations"
            self.icon = "computermouse"
        }
    }
}
