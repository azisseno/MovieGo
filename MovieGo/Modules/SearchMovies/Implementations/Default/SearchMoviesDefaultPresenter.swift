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
        if response.page > 1 {
            view?.appendMovies(response.results)
        } else {
            view?.setMovies(response.results,
                            totalPages: response.total_pages,
                            totalResults: response.total_results)
        }
        view?.reloadData()
    }

    func handleErrorRequest(response: ErrorResponse) {
        view?.errorRequestHandler(response.message)
    }
}
