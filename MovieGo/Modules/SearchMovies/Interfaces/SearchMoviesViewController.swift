//
//  SearchMoviesViewController.swift
//  SearchMovies
//
//  Created by Azis Senoaji Prasetyotomo on 2018. 09. 10..
//  Copyright © 2018. Azis Senoaji Prasetyotomo. All rights reserved.
//

import UIKit

protocol SearchMoviesViewController: class {

    var presenter: SearchMoviesPresenter? { get set }
    var dataSource: UITableViewDataSource! { get set }
}
