//
//  SearchMoviesDefaultPresenter.swift
//  SearchMoviesDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 10..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

class SearchMoviesDefaultPresenter: SearchMoviesPresenter {

    var router: SearchMoviesRouter?
    var interactor: SearchMoviesInteractor?
    weak var view: SearchMoviesViewController?
}
