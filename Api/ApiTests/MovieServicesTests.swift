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
        
        let expectation = self.expectation(description: "Search Movie Called")

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
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertTrue(error == nil)
        }
    }
}
