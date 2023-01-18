//
//  LibraryDataModel.swift
//  Stacked
//
//  Created by Kai Gangi on 12/19/22.
//

import Foundation
import MapKit

class LibraryList {
    static let libraries: [Library] = [
        Library(
            id: 0,
            name: "Adelson Library",
            email: "adelson_lib@cornell.edu",
            address: "159 Sapsucker Woods Rd",
            coordinates: Coordinate(latitude: 42.480025935608936, longitude: -76.45115374232869),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: false,
                rareAndDistinctive: true,
                onSitePrint: false
            )

        ),
        
        Library(
            id: 1,
            name: "Africana Library",
            email: "afrlib@cornell.edu",
            address: "310 Triphammer Rd",
            coordinates: Coordinate(latitude: 42.45773182229579, longitude: -76.48226684588592),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: false
            )
        ),
        
        Library(
            id: 2,
            name: "Annex Library",
            email: nil,
            address: "209 Bookbank Dr",
            coordinates: Coordinate(latitude: 42.443150553649474, longitude: -76.45754149630086),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: false,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: true, // overhead book scanner
                rareAndDistinctive: true,
                onSitePrint: false
            )
        ),
        
        Library(
            id: 3,
            name: "Asia Collections",
            email: "asiaref@cornell.edu",
            address: "216 Feeney Way",
            coordinates: Coordinate(latitude: 42.447813479256986, longitude: -76.48407036082567),
            imageNames: ["download"],
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
                onSitePrint: true
            )
        ),
        
        Library(
            id: 4,
            name: "Catherwood Library",
            email: "ilrref@cornell.edu",
            address: "521 Ives Hall",
            coordinates: Coordinate(latitude: 42.44739391500256, longitude: -76.48103140234574),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: true, // in Kheel Center
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: true,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: false,
                rareAndDistinctive: true,
                onSitePrint: true
            )
        ),
        
        Library(
            id: 5,
            name: "Carpenter Hall",
            email: "engrref@cornell.edu",
            address: "313 Campus Rd",
            coordinates: Coordinate(latitude: 42.4450668943693, longitude: -76.48416544435867),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: false,
                groupStudy: false,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: true,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: true
            )
        ),
        
        Library(
            id: 6,
            name: "Fine Arts Library",
            email: "fineartsref@cornell.edu",
            address: "947 University Ave",
            coordinates: Coordinate(latitude: 42.45141490246682, longitude: -76.48305870202987),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: false
            )
        ),
        
        Library(
            id: 7,
            name: "Law Library",
            email: "lawref@cornell.edu",
            address: "Cornell Law School, Myron Taylor Hall",
            coordinates: Coordinate(latitude: 42.443939956643966, longitude: -76.48578103452421),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true, // for law community
                hasStudyRooms: true, // for law community
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: true // for law community
            )
        ),
        
        Library(
            id: 8,
            name: "Management Library",
            email: "mgtref@cornell.edu",
            address: "114 E Ave", // located in Johnson Graduate School of Management
            coordinates: Coordinate(latitude: 42.44603718435671, longitude: -76.48333320387944),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: false,
                groupStudy: false,
                isAlwaysOpen: true,
                hasCafe: false,
                hasStudyRooms: false, // for Johnson community
                laptopLoansApple: true,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: false
            )
        ),
        
        Library(
            id: 9,
            name: "Mann Library",
            email: "mannref@cornell.edu",
            address: "237 Mann Dr",
            coordinates: Coordinate(latitude: 42.44897726066631, longitude: -76.47639110387945),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: true, // lobby-area spaces
                laptopLoansApple: true,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true, // + poster printing
                rareAndDistinctive: true, // + assistive equipment
                onSitePrint: true
            )
        ),
        
        Library(
            id: 10,
            name: "Mathematics Library",
            email: "mathlib@cornell.edu",
            address: "420 Malott Hall",
            coordinates: Coordinate(latitude: 42.44841414467971, longitude: -76.48017480047771),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: false,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: false
            )
        ),
        
        Library(
            id: 11,
            name: "Music Library",
            email: "musicref@cornell.edu",
            address: "Lincoln Hall, 220 E Ave",
            coordinates: Coordinate(latitude: 42.450224092002635, longitude: -76.48295829580323),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: false
            )
        ),
        
        Library(
            id: 12,
            name: "Nestlé Library",
            email: "hotellibrary@cornell.edu",
            address: "G80 Statler Hall",
            coordinates: Coordinate(latitude: 42.445948267321945, longitude: -76.48285753187446),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: false,
                groupStudy: false,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: false
            )
        ),
        
        Library(
            id: 13,
            name: "Olin Library",
            email: "okuref@cornell.edu",
            address: "161 Ho Plaza",
            coordinates: Coordinate(latitude: 42.44788954667555, longitude: -76.4847304308656),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: false, // Map and Geospatial Info Collection
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: false,
                laptopLoansApple: true,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true, // + Assistive Equipment
                onSitePrint: false
            )
        ),
        
        Library(
            id: 14,
            name: "Physical Sciences Library",
            email: "pslref@cornell.edu",
            address: "293 Clark Hall",
            coordinates: Coordinate(latitude: 42.44988140857898, longitude: -76.48087580812454),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: false,
                groupStudy: false,
                isAlwaysOpen: true,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: true,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: false,
                rareAndDistinctive: false,
                onSitePrint: false
            )
        ),
        
        Library(
            id: 15,
            name: "Rare and Manuscript Collections",
            email: "rareref@cornell.edu",
            address: "2B Carl A. Kroch Library",
            coordinates: Coordinate(latitude: 42.44798011375382, longitude: -76.4841164578516),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: true,
                groupStudy: true,
                isAlwaysOpen: false,
                hasCafe: false,
                hasStudyRooms: false,
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: false,
                rareAndDistinctive: false,
                onSitePrint: false
            )
        ),
        
        Library(
            id: 16,
            name: "Uris Library",
            email: "oku@cornell.edu",
            address: "160 Ho Plaza",
            coordinates: Coordinate(latitude: 42.4477835448041, longitude: -76.48530626457638),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: false,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: true, // cocktail lounge +
                laptopLoansApple: false,
                laptopLoansWindows: false,
                hasPrinters: false,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: true
            )
        ),
        
        Library(
            id: 17,
            name: "Veterinary Library",
            email: "vetref@cornell.edu",
            address: "S1 201, Veterinary Education Center",
            coordinates: Coordinate(latitude: 42.44770063877336, longitude: -76.46594226452412),
            imageNames: ["download"],
            amenities: Amenity(
                quietStudy: false,
                groupStudy: true,
                isAlwaysOpen: true,
                hasCafe: true,
                hasStudyRooms: false, // for Vet community
                laptopLoansApple: true,
                laptopLoansWindows: true,
                hasPrinters: true,
                hasPublicWorkstations: true,
                rareAndDistinctive: true,
                onSitePrint: false
            )
        )
    ]
}
