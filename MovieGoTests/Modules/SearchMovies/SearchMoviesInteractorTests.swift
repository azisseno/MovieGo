//
//  SearchMoviesInteractorTests.swift
//  MovieGoTests
//
//  Created by Azis Senoaji Prasetyotomo on 11/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import MovieGo

class SearchMoviesInteractorTests: XCTestCase {
    
    var interactor = SearchMoviesDefaultInteractor()
    
    func testRefetch() {
        
        let expectation = self.expectation(description: "reFetch")
        
        MockSearchMoviesResponse.start(
            statusCode: 200,
            response: MockSearchMoviesResponse.mockResponse1)
        
        interactor.reFetch()
        
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + .seconds(2),
            execute: {
                expectation.fulfill()
                XCTAssertTrue(self.interactor.response.page == 1)
            }
        )
        
        waitForExpectations(timeout: 4, handler: nil)
    }
    
    func testFetchIfNeeded() {
        
        let expectation = self.expectation(description: "fetchMore")
        
        MockSearchMoviesResponse.start(
            statusCode: 200,
            response: MockSearchMoviesResponse.mockResponse2)
        
        interactor.reFetch()
        
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + .seconds(2),
            execute: {
                expectation.fulfill()
                XCTAssertTrue(self.interactor.response.page == 2)
            }
        )
        
        waitForExpectations(timeout: 4, handler: nil)
    }
    
    func testFetchEmpty() {
        
        let expectation = self.expectation(description: "fetchEmpty")
        
        MockSearchMoviesResponse.start(
            statusCode: 200,
            response: MockSearchMoviesResponse.mockResponseEmpty)
        
        interactor.reFetch()
        
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + .seconds(2),
            execute: {
                expectation.fulfill()
                XCTAssertTrue(self.interactor.response.results.count == 0)
            }
        )
        
        waitForExpectations(timeout: 4, handler: nil)
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }

}
