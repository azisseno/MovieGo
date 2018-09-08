//
//  ApiRequest.swift
//  Api
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import Alamofire

public struct ApiRequest<T>: ApiRequestInterface where T: Codable {
    public typealias ModelResponse = T
    public var path: String
    public var params: Parameters?
    public var method: HTTPMethod
    public var progress: ((Double) -> ())?
    public var onSuccess: ((ModelResponse) -> ())?
    public var onFailure: ((ErrorResponse) -> ())?
}
