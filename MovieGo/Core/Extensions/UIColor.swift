//
//  UIColor.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Constuct UIColor
    ///
    /// - Parameters:
    ///   - red: 0..<256
    ///   - green: 0..<256
    ///   - blue: 0..<256
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /// Construct UIColor with Hex code
    ///
    /// - Parameter rgb: Hex code with `0x` prefix
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    class var alert: UIColor {
        return UIColor(rgb: 0xE36968)
    }
}
