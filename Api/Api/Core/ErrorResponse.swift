//
//  ErrorResponse.swift
//  Api
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation

/// Error model from api, to simplify high level information
public struct ErrorResponse {
    
    public var status: Int
    public var message: String

    init(status: Int, message: String) {
        self.status = status
        self.message = message
    }
}
