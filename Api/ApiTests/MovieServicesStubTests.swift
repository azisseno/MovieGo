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
    
    let stubURL: String = "api.themoviedb.org"
    
    override func setUp() {
        super.setUp()
        
        Api.initInstance(apiBasePath: "http://api.themoviedb.org")
        
    }
    
    func testGetSearchMovieSuccess() {
        
        let expectation = self.expectation(description: "Search Movie Called")

        stub(condition: isHost(stubURL)) { urlRequest in
            let obj: [String : Any] = ["page": 1,
                                       "total_pages": 203,
                                       "total_results": 1234,
                                       "results": []]
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }
        
        MovieServices.getSearchMovie(
            query: "Batman",
            page: 1,
            onSuccess: { movieResponse in
                XCTAssertTrue(movieResponse.page == 1)
                expectation.fulfill()
            },
            onFailure: { error in
                XCTFail()
        }).call()
        
        waitForExpectations(timeout: 3) { error in
            XCTAssertTrue(error == nil)
        }
    }
    
    func testGetSearchMovieNotFound() {

        let statusCode: Int32 = 404
        let message: String = "The resource you requested could not be found."

        requestError(statusCode: statusCode,
                     message: message,
                     errors: nil)
    }
    
    func testGetSearchMovieUnauthorized() {
        
        
        let statusCode: Int32 = 401
        let message: String = "Invalid API key: You must be granted a valid key."
        
        requestError(statusCode: statusCode,
                     message: message,
                     errors: nil)

    }
    
    func testGetSearchMovieUnaccessibleEntity() {
        
        
        let statusCode: Int32 = 422
        let errors: [String] = ["query must be provided"]
        
        requestError(statusCode: statusCode,
                     message: nil,
                     errors: errors)
        
    }
    
    private func requestError(statusCode: Int32,
                              message: String?,
                              errors: [String]?) {
        
        let expectation = self.expectation(description: "Search Movie Called")

        stub(condition: isHost(stubURL)) { urlRequest in
            
            var obj: [String : Any] = [:]
            if let errors = errors {
                obj["errors"] = errors
            }
            if let message = message {
                obj["status_message"] = message
            }
            return OHHTTPStubsResponse(jsonObject: obj,
                                       statusCode: statusCode,
                                       headers: nil)
        }
        
        MovieServices.getSearchMovie(
            query: "Batman",
            page: 1,
            onSuccess: { movieResponse in
                XCTFail()
            },
            onFailure: { error in
                XCTAssertTrue(
                    (error.message == message ?? "" ||
                    error.message == errors?.first ?? "") &&
                    error.status == Int(statusCode))
                expectation.fulfill()
            }
        ).call()
        
        waitForExpectations(timeout: 3) { error in
            XCTAssertTrue(error == nil)
        }

    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }
}
