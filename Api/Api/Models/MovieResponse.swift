//
//  MovieResponse.swift
//  Api
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation

/// Response Model from GET search movie api
public struct MovieResponse: Codable {
    var page: Int = 0
    var total_results: Int
    var total_pages: Int
    var results: [Movie] = []
}
