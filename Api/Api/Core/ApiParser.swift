//
//  ApiParser.swift
//  Api
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation

public protocol APIParser {
    init(json: [String: Any])
}
