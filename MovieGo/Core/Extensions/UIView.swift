//
//  UIView.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Return nib name of UIView.. That's why xib file and UIView class must be same
    static var nib: UINib {
        return UINib(nibName: "\(self)", bundle: nil)
    }

    /// To instance Nib base UIView
    ///
    /// - Returns: The UIView type of the instance cast
    static func instantiateFromNib() -> Self? {
        func instanceFromNib<T: UIView>() ->T? {
            return nib.instantiate() as? T
        }
        return instanceFromNib()
    }
}
