//
//  String.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

extension String {
    
    /// String to Date type
    ///
    /// - Parameter format: Date Formatter String
    /// - Returns: Date type
    func toDate(withFormat format: String = Constant.simpleDateFormat) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        guard let date = dateFormatter.date(from: self) else {
            fatalError("Wrong format, please check")
        }
        return date
    }
}
