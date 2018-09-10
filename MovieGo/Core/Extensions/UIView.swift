//
//  UIView.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T: UIView & ViewFromNib>() -> T {
        let view = T()
        view.awakeFromNib()
        return view
    }
}
