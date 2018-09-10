//
//  SnackBarManagers.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import TTGSnackbar

extension UIViewController {
    
    func showSnackAlert(message: String) {
        let snackBar = TTGSnackbar(message: message, duration: .middle)
        snackBar.backgroundColor = .alert
        snackBar.messageTextColor = .white
        snackBar.messageTextFont = .font(12)
        snackBar.messageTextAlign = .center
        snackBar.show()
    }
}
