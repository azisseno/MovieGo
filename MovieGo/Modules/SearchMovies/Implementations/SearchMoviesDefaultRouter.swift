//
//  SearchMoviesDefaultRouter.swift
//  SearchMoviesDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 10..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit

class SearchMoviesDefaultRouter: SearchMoviesRouter {

    weak var presenter: SearchMoviesPresenter?
    weak var viewController: SearchMoviesDefaultViewController?
    func routeToSearchResults() {
        let searchResultsController = SearchSuggestionsDefaultBuilder().main(delegate: self)
        viewController?.searchResultsController = searchResultsController
    }
    
}

extension SearchMoviesDefaultRouter: SearchSuggestionsDelegate {
    func onSelectKeyword(_ keyword: String) {
        presenter?.handleNewKeyword(keyword)
    }
}
