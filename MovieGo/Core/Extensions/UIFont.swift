//
//  UIFont.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

extension UIFont {
    
    /// System Font Regular
    ///
    /// - Parameter size: Font Size
    /// - Returns: System Font Regular
    static func font(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    /// System Font Medium
    ///
    /// - Parameter size: Font Size
    /// - Returns: System Font Medium
    static func fontMedium(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    /// System Font Bold
    ///
    /// - Parameter size: Font Size
    /// - Returns: System Font Bold
    static func fontBold(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .bold)
    }
}
