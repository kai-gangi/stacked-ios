import Foundation

struct PrivateRoom: Identifiable {
    
    let id = UUID()
    let name: String
    let capacity: Int
    let wheelchairAccessible: Bool
    let powerAvailable: Bool
    
    init(name: String, capacity: Int, wheelchairAccessible: Bool, powerAvailable: Bool) {
        self.name = name
        self.capacity = capacity
        self.wheelchairAccessible = wheelchairAccessible
        self.powerAvailable = powerAvailable
    }
}
