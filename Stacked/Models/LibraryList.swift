import Foundation
import MapKit

struct LibraryList {
    static var servicesDict: [String: [String]] {
        var services = [String: [String]]()
        for library in libraries {
            services[library.name] = library.services
        }
        
        return services
    }
    
    static func getServiceNames(_ library: Library) -> [String] {
        var serviceNames = [String]()
        for service in library.services {
            serviceNames.append(service)
        }
        
        return serviceNames
    }
    
    static let libraries: [Library] = [
        Library(
            id: 0,
            name: "Africana Library",
            formalName: "Africana Library",
            address: "310 Triphammer Rd",
            coordinates: CLLocationCoordinate2D(latitude: 42.45744705864272, longitude: -76.48227618238568),
            image: "africana",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: false,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: true
            ),
            services: [],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 255-3822",
            circNum: "(607) 255-3822",
            email: "afrlib@cornell.edu"
        ),
        
        Library(
            id: 1,
            name: "Annex Library",
            formalName: "Library Annex Contactless Pickup",
            address: "209 Bookbank Dr",
            coordinates: CLLocationCoordinate2D(latitude: 42.44252628307333, longitude: -76.4577786200322),
            image: "annex",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: false,
                isAlwaysOpen: true,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: true,
                rareAndDistinctive: false,
                onSitePrint: true
            ),
            services: ["Reading Room Use"],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: nil,
            circNum: "(607) 253-3431",
            email: nil
        ),
        
        Library(
            id: 2,
            name: "Asia Collections",
            formalName: "Kroch Library, Division of Asia Collections",
            address: "216 Feeney Way",
            coordinates: CLLocationCoordinate2D(latitude: 42.44774414935049, longitude: -76.48408560834626),
            image: "kroch",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: false,
                isAlwaysOpen: false,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: false,
                onSitePrint: true
            ),
            services: ["Exhibition Gallery"],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 255-8199",
            circNum: "(607) 255-4245",
            email: "asiaref@cornell.edu"
        ),
        
        Library(
            id: 3,
            name: "Catherwood Library",
            formalName: "Industrial and Labor Relations Library",
            address: "521 Ives Hall",
            coordinates: CLLocationCoordinate2D(latitude: 42.44722017600582, longitude: -76.48110223517818),
            image: "catherwood",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: true,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: true
            ),
            services: [
                "Reference",
                "Kheel Center",
                "ILR first floor study space"
            ],
            privateRooms: [
                PrivateRoom(
                    name: "136 Table A",
                    capacity: 6,
                    wheelchairAccessible: true,
                    powerAvailable: true
                ),
                PrivateRoom(
                    name: "Room 136 Table B",
                    capacity: 6,
                    wheelchairAccessible: true,
                    powerAvailable: true
                ),
                PrivateRoom(
                    name: "Room 136 Table C",
                    capacity: 1,
                    wheelchairAccessible: true,
                    powerAvailable: true
                ),
                PrivateRoom(
                    name: "Interview Room 230A",
                    capacity: 6,
                    wheelchairAccessible: true,
                    powerAvailable: true
                ),
                PrivateRoom(
                    name: "Room 231A",
                    capacity: 6,
                    wheelchairAccessible: true,
                    powerAvailable: true
                ),
                PrivateRoom(
                    name: "Room 231B",
                    capacity: 6,
                    wheelchairAccessible: true,
                    powerAvailable: true
                )
            ],
            reserveRoomURL: "https://spaces.library.cornell.edu/spaces?lid=527",
            refNum: "(607) 254-5370",
            circNum: "(607) 255-2277",
            email: "ilrref@cornell.edu"
        ),
        
        Library(
            id: 4,
            name: "Carpenter Hall",
            formalName: "Engineering Library card access",
            address: "313 Campus Rd",
            coordinates: CLLocationCoordinate2D(latitude: 42.44481392517968, longitude: -76.48407858327606),
            image: "carpenter",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: false,
                hasStudyRooms: true,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: false,
                onSitePrint: false
            ),
            services: [],
            privateRooms: [
                PrivateRoom(
                    name: "Room 103C",
                    capacity: 10,
                    wheelchairAccessible: false,
                    powerAvailable: false
                ),
                PrivateRoom(
                    name: "Room 231B",
                    capacity: 10,
                    wheelchairAccessible: false,
                    powerAvailable: false
                )
            ],
            reserveRoomURL: "https://spaces.library.cornell.edu/spaces?lid=3403",
            refNum: nil,
            circNum: nil,
            email: "engrref@cornell.edu"
        ),
        
        Library(
            id: 5,
            name: "Fine Arts Library",
            formalName: "Fine Arts Library",
            address: "947 University Ave",
            coordinates: CLLocationCoordinate2D(latitude: 42.451219726612365, longitude: -76.48303366631507),
            image: "art",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: false,
                isAlwaysOpen: false,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: true,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: true
            ),
            services: [],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 255-6716",
            circNum: "(607) 255-3710",
            email: "fineartsref@cornell.edu"
        ),
        
        Library(
            id: 6,
            name: "Hotel Library",
            formalName: "Hotel Library",
            address: "G80 Statler Hall",
            coordinates: CLLocationCoordinate2D(latitude: 42.44544926611289, longitude: -76.48226625119187),
            image: "hotel",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: false,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: false,
                onSitePrint: false
            ),
            services: ["Research Help - hotellibrary@cornell.edu"],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 255-3673",
            circNum: "(607) 255-3673",
            email: "hotellibrary@cornell.edu"
        ),
        
        Library(
            id: 7,
            name: "Law Library",
            formalName: "Law Library",
            address: "Cornell Law School, Myron Taylor Hall",
            coordinates: CLLocationCoordinate2D(latitude: 42.443882678169615, longitude: -76.48572743260587),
            image: "law",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: false,
                hasStudyRooms: true,
                laptopLoansApple: false,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: true
            ),
            services: ["Law Reference (virtual: email lawref@cornell.edu)", "Law Reference (in person)"],
            privateRooms: [
                PrivateRoom(
                    name: "Interview Room B20-A",
                    capacity: 1,
                    wheelchairAccessible: false,
                    powerAvailable: false
                ),
                PrivateRoom(
                    name: "Interview Room B20-B",
                    capacity: 1,
                    wheelchairAccessible: false,
                    powerAvailable: false
                ),
                PrivateRoom(
                    name: "Study Room 471",
                    capacity: 4,
                    wheelchairAccessible: false,
                    powerAvailable: false
                ),
                PrivateRoom(
                    name: "Study Room 473",
                    capacity: 4,
                    wheelchairAccessible: false,
                    powerAvailable: false
                )
            ],
            reserveRoomURL: "https://spaces.library.cornell.edu/spaces?lid=529",
            refNum: "(607) 255-3242",
            circNum: "(607) 255-7236",
            email: "lawref@cornell.edu"
        ),
        
        Library(
            id: 8,
            name: "Management Library",
            formalName: "Management Library Public Access",
            address: "114 E Ave",
            coordinates: CLLocationCoordinate2D(latitude: 42.44591289648435, longitude: -76.4831645812666),
            image: "management",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: false,
                isAlwaysOpen: true,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: false,
                onSitePrint: false
            ),
            services: [
                "Management Library card access",
                "Circulation Service Desk",
                "Research Help - mgtref@cornell.edu"
            ],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 255-3389",
            circNum: "(607) 255-3389",
            email: "mgtref@cornell.edu"
        ),
        
        Library(
            id: 9,
            name: "Mann Library",
            formalName: "Mann Library",
            address: "237 Mann Dr",
            coordinates: CLLocationCoordinate2D(latitude: 42.448794293377034, longitude: -76.47639934074671),
            image: "mann",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: true,
                laptopLoansApple: true,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: true
            ),
            services: [
                "Lobby/Contactless Pickup",
                "Mann RAD Collections",
                "Poster & Specialty Printing",
                "Info & Research Help"
            ],
            privateRooms: [
                PrivateRoom(
                    name: "Room 100",
                    capacity: 17,
                    wheelchairAccessible: true,
                    powerAvailable: true
                ),
                PrivateRoom(
                    name: "Room 102",
                    capacity: 50,
                    wheelchairAccessible: true,
                    powerAvailable: true
                )
            ],
            reserveRoomURL: nil,
            refNum: "(607) 255-3296",
            circNum: "(607) 255-3296",
            email: "mannref@cornell.edu"
        ),
        
        Library(
            id: 10,
            name: "Mathematics Library",
            formalName: "Mathematics Library",
            address: "420 Malott Hall",
            coordinates: CLLocationCoordinate2D(latitude: 42.448234858380786, longitude: -76.47997958890137),
            image: "math",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: false,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: false,
                onSitePrint: true
            ),
            services: [],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 255-5076",
            circNum: "(607) 255-5076",
            email: "mathlib@cornell.edu"
        ),
        
        Library(
            id: 11,
            name: "Music Library",
            formalName: "Music Library",
            address: "Lincoln Hall, 220 E Ave",
            coordinates: CLLocationCoordinate2D(latitude: 42.450190369566634, longitude: -76.48333022061762),
            image: "music",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: false,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: true
            ),
            services: [],
            privateRooms: [],
            reserveRoomURL: "https://spaces.library.cornell.edu/spaces?lid=96",
            refNum: "(607) 255-4011",
            circNum: "(607) 255-4011",
            email: "musicref@cornell.edu"
        ),
        
        Library(
            id: 12,
            name: "Olin Library",
            formalName: "Olin Library",
            address: "161 Ho Plaza",
            coordinates: CLLocationCoordinate2D(latitude: 42.447895337216806, longitude: -76.48428803627493),
            image: "olin",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: false,
                hasCafe: true,
                hasStudyRooms: false,
                laptopLoansApple: true,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: false
            ),
            services: [
                "Interlibrary Services & Borrow Direct (olin-ils@cornell.edu)",
                "Walk-in Reference & Research Help (okuref@cornell.edu)",
                "Map Room (olinmaps@cornell.edu)"
            ],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 255-4144",
            circNum: "(607) 255-4245",
            email: "okuref@cornell.edu"
        ),
        
        Library(
            id: 13,
            name: "Ornithology Library",
            formalName: "Ornithology Library",
            address: "159 Sapsucker Woods Rd",
            coordinates: CLLocationCoordinate2D(latitude: 42.47991061382469, longitude: -76.45105273984396),
            image: "ornithology",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: false,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: true
            ),
            services: [],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 254-2165",
            circNum: "(607) 254-2165",
            email: "adelson_lib@cornell.edu"
        ),
        
        Library(
            id: 14,
            name: "Physical Sciences Library",
            formalName: "Physical Sciences Library",
            address: "293 Clark Hall",
            coordinates: CLLocationCoordinate2D(latitude: 42.44978176568158, longitude: -76.48115618033269),
            image: "physical",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: false,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: false,
                rareAndDistinctive: false,
                onSitePrint: false
            ),
            services: [],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 255-5076",
            circNum: nil,
            email: "pslref@cornell.edu"
        ),
        
        Library(
            id: 15,
            name: "Rare and Manuscript Collections",
            formalName: "Kroch Library, Division of Rare & Manuscript Collections, Research Services",
            address: "2B Carl A. Kroch Library",
            coordinates: CLLocationCoordinate2D(latitude: 42.44775818017193, longitude: -76.48410753816927),
            image: "kroch",
            amenities: Amenity(
                quietStudy: false,
                groupStudy: false,
                isAlwaysOpen: false,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: false,
                rareAndDistinctive: true,
                onSitePrint: true
            ),
            services: ["Exhibition Gallery"],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 255-3530",
            circNum: nil,
            email: "rareref@cornell.edu"
        ),
        
        Library(
            id: 16,
            name: "Uris Library",
            formalName: "Uris Library",
            address: "160 Ho Plaza",
            coordinates: CLLocationCoordinate2D(latitude: 42.44774493518179, longitude: -76.48530774780318),
            image: "uris",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: false,
                hasStudyRooms: true,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: false,
                onSitePrint: true
            ),
            services: [
                "Tower Book Pickup (Cornell ID required)",
                "Cocktail Lounge (Cornell ID required)"
            ],
            privateRooms: [
                PrivateRoom(
                    name: "Room 4B02",
                    capacity: 5,
                    wheelchairAccessible: true,
                    powerAvailable: true
                ),
                PrivateRoom(
                    name: "Room 4B03",
                    capacity: 5,
                    wheelchairAccessible: true,
                    powerAvailable: true
                ),
                PrivateRoom(
                    name: "Room 4B04",
                    capacity: 5,
                    wheelchairAccessible: true,
                    powerAvailable: true
                )
            ],
            reserveRoomURL: "https://spaces.library.cornell.edu/spaces?lid=94",
            refNum: "(607) 255-4144",
            circNum: "(607) 255-4245",
            email: "oku@cornell.edu"
        ),
        
        Library(
            id: 17,
            name: "Veterinary Library",
            formalName: "Veterinary Library Public Access",
            address: "S1 201, Veterinary Education Center",
            coordinates: CLLocationCoordinate2D(latitude: 42.44761022265364, longitude: -76.46587398478222),
            image: "vet",
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: false,
                laptopLoansApple: true,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: false,
                onSitePrint: true
            ),
            services: ["Veterinary College Community Access"],
            privateRooms: [],
            reserveRoomURL: nil,
            refNum: "(607) 253-3499",
            circNum: "(607) 253-3510",
            email: "vetref@cornell.edu"
        )
    ]
}
