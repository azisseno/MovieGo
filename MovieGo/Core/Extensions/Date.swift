//
//  Date.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

extension Date {
    
    /// Date type to String
    ///
    /// - Parameter format: Date Formatter String
    /// - Returns: String type
    func toString(withFormat format: String = Constant.simpleDateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
