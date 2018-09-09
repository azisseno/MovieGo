//
//  JSONDecoder.swift
//  Api
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import Alamofire

extension JSONDecoder {
    
    /// Simplify decoding process of object response from Alamofire function
    ///
    /// - Parameter response: Object response from Alamofire
    /// - Returns: Result with our Model generic type
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
        guard response.error == nil else {
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            return .failure(NSError(domain: "Did not get data in response",
                                    code: response.response?.statusCode ?? 520,
                                    userInfo: nil))
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            return .failure(error)
        }
    }
}
