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

fileprivate struct BaseResponse: Codable {
    var status_code: Int
    var status_message: String
    var success: Bool = true
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
                if let data = self.guardResponse(decoder: decoder, response: response) {
                    self.handleSuccessResponse(decoder: decoder, data: data)
                }
            }
        )
    }
    
    private func guardResponse(decoder: JSONDecoder, response: DataResponse<Data>) -> Data? {
        let baseResult: Result<BaseResponse> = decoder.decodeResponse(from: response)
        switch baseResult {
        case .success(let json):
            if !json.success {
                let errorResponse = ErrorResponse(status: json.status_code,
                                                  message: json.status_message)
                self.onFailure?(errorResponse)
            } else {
                return response.value
            }
        case .failure(let error):
            self.handleAlamoforeError(response: response, err: error)
        }
        return nil
    }
    
    private func handleSuccessResponse(decoder: JSONDecoder, data: Data) {
        do {
            let result: ModelResponse = try decoder.decode(ModelResponse.self, from: data)
            onSuccess?(result)
        } catch {
            let errorResponse: ErrorResponse = ErrorResponse(
                status: 520,
                message: error.localizedDescription)
            onFailure?(errorResponse)
        }
    }
    
    private func handleAlamoforeError(response: DataResponse<Data>,
                                      err: Error) {
        let statusCode: Int = response.response?.statusCode ?? 520
        let error: ErrorResponse = ErrorResponse(
            status: statusCode,
            message: err.localizedDescription)
        onFailure?(error)
    }

}
