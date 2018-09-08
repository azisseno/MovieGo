//
//  Api.swift
//  Api
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import Alamofire

public struct Api {
    
    //MARK: - Config
    public var headers: [String: String]?
    private var apiKey: String {
        return "2696829a81b1b5827d515ff121700838"
    }
    
    var apiBasePath: String {
        return pApiBasePath
    }
    
    var imageBasePath: String {
        return pImageBasePath
    }
    
    private var pApiBasePath: String
    private var pImageBasePath: String
    
    init(apiBasePath: String,
         imageBasePath: String) {
        pApiBasePath = apiBasePath
        pImageBasePath = imageBasePath
    }
    
    private static var instance: Api!
    static var shared: Api {
        return instance
    }
    
    public static func initInstance(apiBasePath: String,
                                    imageBasePath: String) {
        instance = Api(apiBasePath: apiBasePath,
                       imageBasePath: imageBasePath)
    }
    
    //MARK: - Helper
    func createParams() -> Parameters {
        return ["api_key": apiKey]
    }
}
