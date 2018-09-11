//
//  SearchMoviesDefaultPresenter.swift
//  SearchMoviesDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 10..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import Api

class SearchMoviesDefaultPresenter: SearchMoviesPresenter {
    
    private var moviesFound: [Movie] = []
    private var currentResponse: MovieResponse?

    var router: SearchMoviesRouter?
    var interactor: SearchMoviesInteractor?
    weak var view: SearchMoviesViewController?
    
    func onTapSearchButton(keyword: String) {
        interactor?.reFetch(keyword: keyword)
    }

    func onReachBottomScroll() {
        interactor?.fetchMoreIfNeeded()
    }
    
    func onPullToRefresh() {
        interactor?.reFetch(keyword: nil)
    }
    
    func handleSuccessRequest(response: MovieResponse) {
        if let currentResponse = currentResponse,
            response.page > currentResponse.page {
            moviesFound += response.results
        } else {
            moviesFound = response.results
        }
        currentResponse = response
        view?.showMovies(moviesFound)
    }

    func handleErrorRequest(response: ErrorResponse) {
        view?.showErrorMessage(response.message)
    }
}
