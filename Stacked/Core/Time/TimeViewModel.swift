import Foundation
import SwiftSoup
import SwiftUI

class TimeViewModel: ObservableObject {

    static var shared = TimeViewModel()
    let calendar = Calendar.current
    let currentDate = Date()
    var scrapedHours = UserDefaults.standard.array(forKey: "hours") as? [[[String]]] ?? [[[String]]]()
    var dayIndex = 0
    
    @Published var openingLibraries = [Library]()
    @Published var openLibraries = [Library]()
    @Published var closingLibraries = [Library]()
    @Published var closedLibraries = [Library]()
    
    func scrapeHours() -> [[[String]]] {
        do {
            let url = "https://spaces.library.cornell.edu/hours/"
            var libraryHoursData = [[[String]]]()
            
            let html = try String(contentsOf: URL(string: url)!)
            let document = try SwiftSoup.parse(html)
            let body = try document.select("tbody")
            let bodyComponents = try body.select("td")
            
            var libraryHoursDay = [[String]]()
            var library = [String]()
            for i in 1...51*8*2 {
                let details = try bodyComponents[i-1].text()
                library.append(details)
                if i % 8 == 0 {
                    libraryHoursDay.append(library)
                    library.removeAll()
                }
                
                if i % (51 * 8) == 0 {
                    libraryHoursData.append(libraryHoursDay)
                    libraryHoursDay.removeAll()
                }
            }
            
            return libraryHoursData
        } catch {
            print("Error: \(error)")
        }
        
        return [[[""]]]
    }
    
    func loadOpeningHours() {
        let components = calendar.dateComponents([.weekday, .hour, .minute], from: currentDate)
        let openingHours = scrapeHours()
        UserDefaults.standard.set(openingHours, forKey: "hours")
        scrapedHours = UserDefaults.standard.array(forKey: "hours") as? [[[String]]] ?? [[[String]]]()
    }
    
    func getLibraryHours(_ library: Library) -> [String] {
        var libHours = [[String]]()
        for week in scrapedHours {
            for lib in week {
                if lib.first! == library.formalName {
                    libHours.append(
                        lib.filter {
                            $0 != library.formalName
                        }
                    )
                }
            }
        }

        return formatHours(Array(libHours.joined()))
    }
    
    func getServiceHours(_ library: Library) -> [String: [String]] {
        var serviceHours = [String: [String]]()
        for week in scrapedHours {
            for service in week {
                let serviceNames = LibraryList.getServiceNames(library)
                if serviceNames.contains(service.first!) {
                    var hours = service.filter { $0 != service.first! }
                    hours = formatHours(hours)
                    let keyExists = serviceHours[service.first!] != nil
                    
                    if keyExists {
                        serviceHours[service.first!]!.append(contentsOf: hours)
                    } else {
                        serviceHours[service.first!] = hours
                    }
                }
            }
        }

        return serviceHours
    }
    
    func formatHours(_ hours: [String]) -> [String] {
        var formattedHours = [String]()
        for i in 0..<hours.count {
            if hours[i] == "Closed" {
                formattedHours.append("Closed")
            } else if hours[i] == "24/7 Study Space & Computing" || hours[i] == "24 Hours" {
                formattedHours.append("Always Open")
            } else if Int(hours[i].prefix(1)) != nil {
                let openClosedHours = hours[i].components(separatedBy: " ")
                
                var openHours = openClosedHours.first!
                openHours = openHours.replacingOccurrences(of: "am", with: " AM")
                openHours = openHours.replacingOccurrences(of: "pm", with: " PM")

                var closedHours = openClosedHours.last!
                closedHours = closedHours.replacingOccurrences(of: "am", with: " AM")
                closedHours = closedHours.replacingOccurrences(of: "pm", with: " PM")
                
                if !openHours.contains(":") {
                    let numComponent = openHours.components(separatedBy: " ").first!
                    openHours = openHours.replacingOccurrences(of: numComponent, with: numComponent+":00")
                    
                }
                
                if !closedHours.contains(":") {
                    let numComponent = closedHours.components(separatedBy: " ").first!
                    closedHours = closedHours.replacingOccurrences(of: numComponent, with: numComponent+":00")
                }
                
                formattedHours.append(openHours + " - " + closedHours)
            } else {
                formattedHours.append("Closed")
            }
        }
        
        return formattedHours
    }

    func loadDay() -> String {
        let dayOfWeek = calendar.component(.weekday, from: currentDate)
        switch dayOfWeek {
        case 1:
            dayIndex = 0
            return "Su"
        case 2:
            dayIndex = 1
            return "M"
        case 3:
            dayIndex = 2
            return "Tu"
        case 4:
            dayIndex = 3
            return "W"
        case 5:
            dayIndex = 4
            return "Th"
        case 6:
            dayIndex = 5
            return "Fr"
        case 7:
            dayIndex = 6
            return "Sa"
        default:
            return ""
        }
    }
    
    func libOpenStatus(_ library: Library) {
        let weeklyHours = getLibraryHours(library)
        if ["Closed", "Unavailable Hours", "By Appointment"].contains(weeklyHours[dayIndex]) {
            closedLibraries.append(library)
        } else if weeklyHours[dayIndex] == "Always Open" {
            openLibraries.append(library)
        } else {
            let hour = calendar.component(.hour, from: currentDate)
            let minutes = calendar.component(.minute, from: currentDate)
            let totalMinutes = (hour * 60) + minutes
            
            let openingTime = getTime(weeklyHours, opening: true, dayIndex)
            let closingTime = getTime(weeklyHours, opening: false, dayIndex)
            
            let openingMinutes = minutesElapsed(openingTime)
            let closingMinutes = minutesElapsed(closingTime)
            
            if totalMinutes >= openingMinutes && totalMinutes < closingMinutes && totalMinutes + 60 > closingMinutes {
                closingLibraries.append(library)
            } else if totalMinutes >= openingMinutes && totalMinutes < closingMinutes {
                openLibraries.append(library)
            } else if totalMinutes < openingMinutes && totalMinutes + 60 >= openingMinutes {
                openingLibraries.append(library)
            } else {
                closedLibraries.append(library)
            }
        }
    }
    
    func getTime(_ weeklyHours: [String], opening: Bool, _ dayIndex: Int) -> String {
        let todaysHours = weeklyHours[dayIndex]
        let todaysHoursComponents = todaysHours.components(separatedBy: " - ")
        
        if opening {
            return todaysHoursComponents.first!
        } else {
            return todaysHoursComponents.last!
        }
    }
    
    func minutesElapsed(_ time: String) -> Int {
        let timeComponents = time.components(separatedBy: " ")
        let time = timeComponents.first!
        let meridianStatus = timeComponents.last!
        
        let hourComponents = time.components(separatedBy: ":")
        let hours = hourComponents.first!
        let minutes = hourComponents.last!
        
        if meridianStatus == "AM" {
            let minutesElapsed = Int(hours)! * 60 + Int(minutes)!
            return minutesElapsed
        } else {
            let minutesElapsed = (12 * 60) + (Int(hours)! * 60) + Int(minutes)!
            return minutesElapsed
        }
    }
    
    func openingStatusLib(_ library: Library) -> String {
        if openingLibraries.contains(library) {
            return "Opening Soon"
        } else if openLibraries.contains(library) {
            return "Open"
        } else if closingLibraries.contains(library) {
            return "Closing Soon"
        } else {
            return "Closed"
        }
    }
    
    func openingStatusColorLib(_ library: Library) -> Color {
        if openLibraries.contains(library) {
            return Color.green
        } else if closedLibraries.contains(library) {
            return AppColor.red
        } else {
            return Color.yellow
        }
    }
    
    func isLibOpen(_ library: Library) -> Bool {
        if openLibraries.contains(library) {
            return true
        } else {
            return false
        }
    }
    
    func openingStatusSuffix(_ library: Library) -> String {
        let weeklyHours = getLibraryHours(library)
        let openingTime = getTime(weeklyHours, opening: true, dayIndex)
        let closingTime = getTime(weeklyHours, opening: false, dayIndex)
        
        let hour = calendar.component(.hour, from: currentDate)
        let minutes = calendar.component(.minute, from: currentDate)
        let totalMinutes = (hour * 60) + minutes

        if openLibraries.contains(library) {
            if getLibraryHours(library)[dayIndex] == "Always Open" {
                return " until 11:59 PM"
            } else {
                return " until \(closingTime)"
            }
        } else if openingLibraries.contains(library) {
            let openingMinutes = minutesElapsed(openingTime)
            let minutesUntil = openingMinutes - totalMinutes
            return " in \(minutesUntil)m"
        } else if closingLibraries.contains(library) {
            let closingMinutes = minutesElapsed(closingTime)
            let minutesLeft = closingMinutes - totalMinutes
            return " in \(minutesLeft)m"
        } else {
            if Int(getLibraryHours(library)[dayIndex].prefix(1)) != nil {
                let openingMinutes = minutesElapsed(openingTime)
                let minutesLeft = openingMinutes - totalMinutes
                if minutesLeft > 0 {
                    return " until \(openingTime)"
                }
                
                return " until tomorrow"
            }
            
            return " today"
        }
    }
}
