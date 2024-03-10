//
//  SettingView.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 10/03/24.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDarkMode") var isDarkMode = false

    var body: some View {
        VStack {
            Toggle("Dark Mode", isOn: $isDarkMode)
                .padding()
                .onChange(of: isDarkMode) { newValue in
                    updateColorScheme(newValue)
                }
            Spacer()
        }
        .navigationBarTitle("Settings")
    }

    func updateColorScheme(_ isDarkMode: Bool) {
        // Update the color scheme using the Environment property
        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
    }
}
