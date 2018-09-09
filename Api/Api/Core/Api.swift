//
//  Api.swift
//  Api
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import Alamofire

/// Api is an internal shared instance that
/// contains base information to request api
public struct Api {
    
    //MARK: - Config
    var headers: [String: String]? {
        return nil
    }
    
    private var apiKey: String {
        return "2696829a81b1b5827d515ff121700838"
    }
    
    var apiBasePath: String {
        return pApiBasePath
    }
    
    private var pApiBasePath: String
    
    /// Api constructor,
    /// api base path is initiated from outside to accomodate backend environment for each target
    /// - Parameters:
    ///   - apiBasePath: base path for api request
    init(apiBasePath: String) {
        pApiBasePath = apiBasePath
    }
    
    private static var instance: Api!
    static var shared: Api {
        return instance
    }
    
    public static func initInstance(apiBasePath: String) {
        instance = Api(apiBasePath: apiBasePath)
    }
    
    //MARK: - Helper
    /// To create initial parameters
    ///
    /// - Returns: initial parameters
    func createParams() -> Parameters {
        return ["api_key": apiKey]
    }
}
