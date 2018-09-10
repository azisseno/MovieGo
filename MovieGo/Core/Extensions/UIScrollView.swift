//
//  UIScrollView.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

extension UIScrollView {
    func isReachingBottom() -> Bool {
        return contentOffset.y >= 0
            && contentOffset.y >= (contentSize.height - frame.size.height)
    }
}
