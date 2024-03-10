//
//  ViewExtensions.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 07/03/24.
//

import SwiftUI

extension View {
     func customFont(_ uiFont: UIFont) -> some View {
        self.font(Font(uiFont as CTFont))
    }
}
extension Text {
    func customFontText(_ uiFont: UIFont) -> Text {
        self.font(Font(uiFont as CTFont))
    }
}
