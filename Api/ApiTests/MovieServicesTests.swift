//
//  MovieServicesTests.swift
//  ApiTests
//
//  Created by Azis Senoaji Prasetyotomo on 09/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Api

class MovieServicesTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        Api.initInstance(apiBasePath: "http://api.themoviedb.org/3",
                         imageBasePath: "​http://image.tmdb.org/t/p")

    }
    
    func testGetSearchMovie() {
        
        let expectation = XCTestExpectation(description: "Search Movie Called")

        MovieServices.getSearchMovie(
            query: "Batman",
            page: 1,
            progress: { progress in
                XCTAssertTrue(progress <= 1.0)
            },
            onSuccess: { movieResponse in
                expectation.fulfill()
            },
            onFailure: { errorResponse in
                XCTFail("Error Api Call= \(errorResponse)")
            }
        ).call()
        
        let result = XCTWaiter.wait(for: [expectation], timeout: 10.0) // wait and store the result
        XCTAssertEqual(result, .completed) // check if the result is completed before timeout

    }
}
