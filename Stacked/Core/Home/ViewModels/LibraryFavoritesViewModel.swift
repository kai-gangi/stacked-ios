import Foundation

final class LibraryFavoritesViewModel: ObservableObject {
    
    static var shared = LibraryFavoritesViewModel()
    private let saveKey = "favorites"
    @Published var libraries: Set<Int>

    init() {
        let loaded_data = UserDefaults.standard.array(forKey: saveKey) as? [Int] ?? [Int]()
        self.libraries = Set(loaded_data)
    }
    
    func contains(_ library: Library) -> Bool {
        libraries.contains(library.id)
    }
    
    func add(_ library: Library) {
        libraries.insert(library.id)
        save()
    }
    
    func remove(_ library: Library) {
        libraries.remove(library.id)
        save()
    }
    
    func save() {
        let array = Array(libraries)
        UserDefaults.standard.set(array, forKey: saveKey)
    }
}

    


