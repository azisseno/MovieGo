//
//  Movie.swift
//  Api
//
//  Created by Azis Senoaji Prasetyotomo on 09/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import Foundation

/// Movie model from api
public struct Movie: Codable {
    public var vote_count: Int
    public var id: Int
    public var video: Bool
    public var vote_average: Float
    public var title: String
    public var popularity: Float
    public var poster_path: String?
    public var original_language: String
    public var original_title: String
    public var genre_ids: [Int]
    public var backdrop_path: String?
    public var adult: Bool
    public var overview: String
    public var release_date: String
}
