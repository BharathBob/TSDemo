//
//  SplashView.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 10/03/24.
//

import Foundation
import SwiftUI

struct SplashScreen: View {
    @State private var scale = 0.7
    @Binding var isActive: Bool
    var body: some View {
        VStack {
            Spacer()

            VStack {
                Image("app_videoicon")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
            }.scaleEffect(scale)
            Spacer()
            Text("By Viswa Bharath Dakka")
                 .foregroundColor(.gray)
                .customFont(CustomFont.appFont(18, fontstyle: .regular))
            .onAppear{
                withAnimation(.easeIn(duration: 0.7)) {
                    self.scale = 0.9
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
