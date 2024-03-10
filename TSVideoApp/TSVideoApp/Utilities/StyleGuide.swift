//
//  StyleGuide.swift
//  TSVideoApp
//
//  Created by Viswa bharath on 08/03/24.
//

import Foundation
import UIKit

enum FontStyle:String {
    case regular  = "Montserrat-Regular"
    case bold     = "Montserrat-Bold"
    case italic   = "Montserrat-Italic-VariableFont_wght"
 }

enum CustomFont {
    static func appFont(_ size: CGFloat, fontstyle: FontStyle) -> UIFont {
        return UIFont(name: fontstyle.rawValue, size: size)!
    }
}
