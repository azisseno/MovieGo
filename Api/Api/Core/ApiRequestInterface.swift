//
//  ApiRequestInterface.swift
//  Api
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import Alamofire

public protocol ApiRequestInterface {
    associatedtype ModelResponse: APIParser
    var path: String { get }
    var params: Parameters? { get }
    var method: Alamofire.HTTPMethod { get }
    var progress: ((Double) -> ())? { get }
    var onSuccess: ((ModelResponse) -> ())? { get }
    var onFailure: ((ErrorResponse) -> ())? { get }
}
