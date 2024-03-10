//
//  ViewCoordinator.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 10/03/24.
//

import Foundation
import SwiftUI

struct ViewCoordinator: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            if isActive {
                ContentView()
            } else {
                SplashScreen(isActive: $isActive)
            }
        }
        .preferredColorScheme(isActive ? .dark : .light) // Set preferred color scheme based on isActive
    }
}
