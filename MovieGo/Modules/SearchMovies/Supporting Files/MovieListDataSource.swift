//
//  MovieListDataSource.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit
import Api

/// Data Source for Movie List
class MovieListDataSource: NSObject, UITableViewDataSource {
    
    var movies: [Movie] = []
    
    //MARK: - UITableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieListViewCell
        let movie = movies[indexPath.row]
        
        var releaseDateText = "Release Date:\n"
        if movie.release_date.isEmpty {
            releaseDateText += "Unknown"
        } else {
            releaseDateText += movie.release_date.toDate()
                .toString(withFormat: Constant.releaseDateFormat)
        }
        cell.movieListView.set(posterPath: movie.poster_path,
                               title: movie.title,
                               releaseDateText: releaseDateText,
                               overview: movie.overview)
        cell.selectionStyle = .none
        return cell
    }
}
