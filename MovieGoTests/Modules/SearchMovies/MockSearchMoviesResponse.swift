//
//  MockSearchMoviesResponse.swift
//  MovieGoTests
//
//  Created by Azis Senoaji Prasetyotomo on 11/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation
import OHHTTPStubs
@testable import MovieGo
import Api

struct MockSearchMoviesResponse {
    
    private static let stubURL: String = "api.themoviedb.org"
    
    static var mockMovie: [String: Any] {
        return [
            "vote_count": 12,
            "id": 1,
            "video": true,
            "vote_average": 4.5,
            "title": "Batman Begin",
            "popularity": 4.5,
            "original_language": "en",
            "original_title": "Batman Begin",
            "genre_ids": [1,3,4],
            "adult": true,
            "overview": "Overview is short",
            "release_date": "2015-03-03"
        ]
    }
    
    static var mockResponse1: [String: Any] {
        return [
        "page": 1,
         "total_pages": 203,
         "total_results": 20,
         "results": [mockMovie, mockMovie]
        ]
    }
    
    static var mockResponse2: [String: Any] {
        return [
            "page": 2,
            "total_pages": 203,
            "total_results": 20,
            "results": [mockMovie, mockMovie]
        ]
    }
    
    static var mockResponseEmpty: [String: Any] {
        return [
            "page": 1,
            "total_pages": 0,
            "total_results": 0,
            "results": []
        ]
    }

    static func start(statusCode: Int32, response: [String: Any]) {
        stub(condition: isHost(stubURL)) { urlRequest in
            let obj: [String : Any] = response
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }
    }
    
}
