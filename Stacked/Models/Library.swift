import MapKit

final class Library: Identifiable, Equatable, ObservableObject, Hashable {
    
    let id: Int
    let name: String
    let formalName: String
    let address: String
    let coordinates: CLLocationCoordinate2D
    let image: String
    let amenities: Amenity
    let services: [String]
    let privateRooms: [PrivateRoom]
    let reserveRoomURL: String?
    let refNum: String?
    let circNum: String?
    let email: String?
    
    init(id: Int, name: String, formalName: String, address: String, coordinates: CLLocationCoordinate2D, image: String, amenities: Amenity, services: [String], privateRooms: [PrivateRoom], reserveRoomURL: String?, refNum: String?, circNum: String?, email: String?) {
        self.id = id
        self.name = name
        self.formalName = formalName
        self.address = address
        self.coordinates = coordinates
        self.image = image
        self.amenities = amenities
        self.services = services
        self.privateRooms = privateRooms
        self.reserveRoomURL = reserveRoomURL
        self.refNum = refNum
        self.circNum = circNum
        self.email = email
    }
    
    static func == (lhs: Library, rhs: Library) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
