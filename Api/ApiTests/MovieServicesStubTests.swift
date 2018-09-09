//
//  MovieServicesStubTests.swift
//  ApiTests
//
//  Created by Azis Senoaji Prasetyotomo on 09/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Api

class MovieServicesStubTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        Api.initInstance(apiBasePath: "api.themoviedb.org",
                         imageBasePath: "​http://image.tmdb.org/t/p")
        
    }
    
    func testGetSearchMovieSuccess() {
        
        stub(condition: isHost(Api.shared.apiBasePath)) { urlRequest in
            let obj: [String : Any] = ["page": 1,
                                       "total_results": 1234]
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }
        
        MovieServices.getSearchMovie(
            query: "Batman",
            page: 1,
            onSuccess: { movieResponse in
                XCTAssertTrue(movieResponse.page == 1 &&
                    movieResponse.total_results == 1234)
        },
            onFailure: { error in
                XCTFail()
        }).call()
        
    }
    
    func testGetSearchMovieNotFound() {
        
        let message: String = "The resource you requested could not be found."
        
        stub(condition: isHost(Api.shared.apiBasePath)) { urlRequest in
            let obj: [String : Any] = ["status_code": 34,
                                       "status_message": message]
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 404, headers: nil)
        }
        
        MovieServices.getSearchMovie(
            query: "Batman",
            page: 1,
            onSuccess: { movieResponse in
                XCTFail()
        },
            onFailure: { error in
                XCTAssertTrue(error.message == message)
        }).call()
        
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }
}
