//
//  MovieServices.swift
//  Api
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import Alamofire

/// Movie services
public struct MovieServices {
    
    /**
     Get Search Movies
     Path: /search/movie/
     */
    public static func getSearchMovie(
        query: String,
        page: Int? = nil,
        progress: ((Double) -> ())? = nil,
        onSuccess: ((MovieResponse) -> ())? = nil,
        onFailure: ((ErrorResponse) -> ())? = nil) -> ApiRequest<MovieResponse> {
        
        var params = Api.shared.createParams()
        params["query"] = query
        if let page = page {
            params["page"] = page
        }
        
        return ApiRequest<MovieResponse>(
            path: "/search/movie",
            params: params,
            method: .get,
            progress: progress,
            onSuccess: onSuccess,
            onFailure: onFailure
        )
    }
}
