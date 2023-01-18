import SwiftUI

struct LibraryListView: View {
    
    var libraries: [Library] = LibraryList.libraries    
    
    @State var selectedIndex = 0
    let tabImages = ["books.vertical", "map"]
    let tabImagesSelected = ["books.vertical.fill", "map.fill"]
    
    @ObservedObject private var favoritesViewModel = LibraryFavoritesViewModel.shared
    @ObservedObject private var filtersViewModel = LibraryFiltersViewModel.shared
    @ObservedObject private var timeViewModel = TimeViewModel.shared
    @ObservedObject private var mapViewModel = MapViewModel.shared
    
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        
        let favoriteLibraries = libraries.filter { favoritesViewModel.libraries.contains($0.id) }
        let filteredLibraries = filtersViewModel.filteredLibraries
        let favoritesIntersectFiltered = favoriteLibraries.filter { filteredLibraries.contains($0) }
        let filteredMinusFavorites = filteredLibraries.filter { !favoriteLibraries.contains($0) }
       
        VStack(spacing: 0) {
            ZStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        List {
                            LibraryFiltersView()
                                .frame(maxWidth: .infinity)
                                .listRowSeparator(.hidden)
                            
                            if favoritesIntersectFiltered.count > 0 {
                                favoritesHeader
                                
                                ForEach(favoritesIntersectFiltered, id: \.id) { library in
                                    favoriteLibrary(library)
                                }
                            }
                                            
                            let openLibraries = timeViewModel.openLibraries.filter {
                                filteredMinusFavorites.contains($0)
                            }
                            
                            if openLibraries.count > 0 {
                                openHeader
                                
                                ForEach(openLibraries, id: \.id) { library in
                                    openLibrary(library)
                                }
                            }
                            
                            let closedLibraries = timeViewModel.closedLibraries.filter {
                                filteredMinusFavorites.contains($0)
                            }
                            
                            if closedLibraries.count > 0 {
                                closedHeader
                                
                                ForEach(closedLibraries, id: \.id) { library in
                                    closedLibrary(library)
                                }
                            }
                        }
                        .navigationTitle("Libraries")
                        .listStyle(PlainListStyle())
                    }
                    .onAppear {
                        mapViewModel.checkIfLocationServicesIsEnabled()
                    }
                case 1:
                    MapView()
                        .environmentObject(MapViewModel())
                default:
                    LibraryListView()
                }
            }
                    
            VStack(spacing: 0) {
                Divider()
            
                HStack {
                    ForEach(0..<2) { num in
                        Spacer()
                        
                        Image(systemName: selectedIndex == num ? tabImagesSelected[num] : tabImages[num])
                            .scaleEffect(selectedIndex == num ? 1.25 : 1.0)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(selectedIndex == num ? Color.red : .init(white: 0.8))
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.1)) {
                                    selectedIndex = num
                                }
                            }
                        
                        Spacer()
                    }
                }
                .frame(width: nil, height: 60)
                .background(.white)
            }
        }
    }
}

extension LibraryListView {
    private var favoritesHeader: some View {
        Section {
            Text("Favorites")
                .font(.custom("Inter-Bold", size: 24))
        }
        .listRowSeparator(.hidden)
    }
    
    private func favoriteLibrary(_ library: Library) -> some View {
        NavigationLink {
            LibraryDetailView(library: library)
        } label: {
            LibraryCellView(library: library)
        }
        .listRowSeparator(.hidden)
    }
    
    private var openHeader: some View {
        Section {
            Text("Open")
                .font(.custom("Inter-Bold", size: 24))
                .padding(.top)
        }
        .listRowSeparator(.hidden)
    }
    
    private func openLibrary(_ library: Library) -> some View {
        NavigationLink {
            LibraryDetailView(library: library)
        } label: {
            LibraryCellView(library: library)
        }
        .listRowSeparator(.hidden)
    }
    
    private var closedHeader: some View {
        Section {
            Text("Closed")
                .font(.custom("Inter-Bold", size: 24))
                .padding(.top)
        }
        .listRowSeparator(.hidden)
    }
    
    private func closedLibrary(_ library: Library) -> some View {
        NavigationLink {
            LibraryDetailView(library: library)
        } label: {
            LibraryCellView(library: library)
        }
        .listRowSeparator(.hidden)
    }
}
