//
//  Connectivity.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import Alamofire
import Api

/// All about connectivity helper
class Connectivity {
    
    /// Check wether device is connected to internet
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    /// Error model `No internet connection`
    class var error: ErrorResponse {
        return ErrorResponse(status: 502,
                             message: "Internet connection appears to be offline")
    }
}
