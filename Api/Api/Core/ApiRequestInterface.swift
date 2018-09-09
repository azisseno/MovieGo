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
    associatedtype ModelResponse: Codable
    var path: String { get }
    var params: Parameters? { get }
    var method: Alamofire.HTTPMethod { get }
    var progress: ((Double) -> ())? { get }
    var onSuccess: ((ModelResponse) -> ())? { get }
    var onFailure: ((ErrorResponse) -> ())? { get }
}

fileprivate struct ErrorStackResponse: Codable {
    var errors: [String]?
    var status_message: String?
}

extension ApiRequestInterface {
    @discardableResult
    public func call() -> DataRequest {
        
        return Alamofire.request(Api.shared.apiBasePath + path,
                                 method: method,
                                 parameters: params,
                                 headers: Api.shared.headers)
            .downloadProgress(closure: { prg in
                self.progress?(prg.fractionCompleted)
            })
            .responseData(completionHandler: { response in
                let decoder = JSONDecoder()
                let result: Result<ModelResponse> = decoder.decodeResponse(from: response)
                switch result {
                case .success(let object):
                    self.onSuccess?(object)
                case .failure(let error):
                    self.handleAlamoforeError(decoder: decoder,
                                              response: response,
                                              error: error)
                }
            }
        )
    }
    
    private func handleAlamoforeError(decoder: JSONDecoder,
                                      response: DataResponse<Data>,
                                      error: Error) {
        var message = error.localizedDescription
        let statusCode: Int = response.response?.statusCode ?? 520
        if let data = response.result.value {
            do {
                let errorStack = try decoder.decode(ErrorStackResponse.self, from: data)
                if let errors = errorStack.errors, let errorMessage = errors.first {
                    message = errorMessage
                }
                if let errorMessage = errorStack.status_message {
                    message = errorMessage
                }
            } catch {
                message = error.localizedDescription
            }
        }
        let error: ErrorResponse = ErrorResponse(
            status: statusCode,
            message: message)
        onFailure?(error)
    }

}
