//
//  SearchMoviesDefaultInteractor.swift
//  SearchMoviesDefault
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 10..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import Foundation
import UIKit
import Api

class SearchMoviesDefaultInteractor: SearchMoviesInteractor {

    weak var presenter: SearchMoviesPresenter?

    func fetchMovie(page: Int, keyword: String) {
        MovieServices.getSearchMovie(
            query: keyword,
            page: page,
            onSuccess: { movieResponse in
                
            }, onFailure: { error in
            
            }
        ).call()
    }
}
