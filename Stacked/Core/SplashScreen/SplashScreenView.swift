import SwiftUI
import UIKit

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @ObservedObject var timeViewModel = TimeViewModel.shared
    var libraries = LibraryList.libraries
    
    var body: some View {
        if isActive {
            LibraryListView()
        } else {
            ZStack {
                Color.red.ignoresSafeArea()
    
                VStack {
                    VStack {
                        Image("transparent")
                            .resizable()
                            .font(.system(size: 12))
                            .frame(width: 180, height: 180)
                        
                        Text("Stacked")
                            .font(.custom("Inter-Bold", size: 36))
                            .foregroundColor(.white)
                            .offset(y: -15)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.0)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {
                            self.isActive = true
                        }
                        
                        timeViewModel.loadOpeningHours()
                        timeViewModel.loadDay()
                                        
                        for library in libraries {
                            timeViewModel.libOpenStatus(library)
                        }
                        
                        for lib in libraries {
                            timeViewModel.getServiceHours(lib)
                        }
                    }
                }
            }
        }
    }
}
