//
//  MovieListDataSource.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit
import Api

class MovieListDataSource: NSObject, UITableViewDataSource {
    
    var movies: [Movie] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieListViewCell
        let movie = movies[indexPath.row]
        cell.movieListView.set(posterPath: movie.poster_path,
                               title: movie.title,
                               releaseDateText: movie.release_date,
                               overview: movie.overview)
        cell.selectionStyle = .none
        return cell
    }
}
