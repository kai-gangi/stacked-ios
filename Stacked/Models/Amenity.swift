struct Amenity {

    let quietStudy: Bool
    let groupStudy: Bool
    let isAlwaysOpen: Bool
    let hasCafe: Bool
    let hasStudyRooms: Bool

    let laptopLoansApple: Bool
    let laptopLoansWindows: Bool
    let hasPrinters: Bool
    let hasPublicWorkstations: Bool
   
    let rareAndDistinctive: Bool
    let onSitePrint: Bool
    
    func getSpaces() -> [String] {
        var availableSpaces = [String]()
        
        let librarySpaces = [
            "Quiet Study": quietStudy,
            "Group Study": groupStudy,
            "Open 24/7": isAlwaysOpen,
            "Cafe": hasCafe,
            "Study Rooms": hasStudyRooms
        ]
        
        for space in librarySpaces.keys {
            if librarySpaces[space] ?? false {
                availableSpaces.append(space)
            }
        }
        
        return availableSpaces.sorted { $0.lowercased() < $1.lowercased() }
    }
    
    func getTechnology() -> [String] {
        var availableTechnology = [String]()
        
        let libraryTechnology = [
            "Laptop Loans (Apple and Windows)": laptopLoansApple && laptopLoansWindows,
            "Laptop Loans (Apple)": laptopLoansApple && !laptopLoansWindows,
            "Laptop Loans (Windows)": laptopLoansWindows && !laptopLoansApple,
            "Printers": hasPrinters,
            "Public Workstations": hasPublicWorkstations,
        ]
        
        for tech in libraryTechnology.keys {
            if libraryTechnology[tech] ?? false {
                availableTechnology.append(tech)
            }
        }
        
        return availableTechnology.sorted { $0.lowercased() < $1.lowercased() }
    }
    
    func getCollections() -> [String] {
        var availableCollections = [String]()
        
        let libraryCollections = [
            "Rare and Distinctive": rareAndDistinctive,
            "On-site Print": onSitePrint
        ]
        
        for col in libraryCollections.keys {
            if libraryCollections[col] ?? false {
                availableCollections.append(col)
            }
        }
        
        return availableCollections.sorted { $0.lowercased() < $1.lowercased() }
    }
}
