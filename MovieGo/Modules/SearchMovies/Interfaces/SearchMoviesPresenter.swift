//
//  SearchMoviesPresenter.swift
//  SearchMovies
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 10..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation

protocol SearchMoviesPresenter: class {

    var router: SearchMoviesRouter? { get set }
    var interactor: SearchMoviesInteractor? { get set }
    var view: SearchMoviesViewController? { get set }
    
    func onTapSearchButton()
    
}
