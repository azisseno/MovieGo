//
//  MovieListView.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

class MovieListView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "MovieListView"
    }
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
        setupSubViews()
    }
    
    func set(posterPath: String?,
             title: String,
             releaseDateText: String,
             overview: String) {
        titleLabel.text = title
        releaseDateLabel.text = releaseDateText
        overviewLabel.text = overview
        guard let posterPath = posterPath else { return }
        posterImage.loadPoster(placeholder: #imageLiteral(resourceName: "poster_placeholder_ico"),
                               path: posterPath,
                               posterSize: .w185)
    }
    
    private func setupSubViews() {
        // Setup Poster Image View
        posterImage.contentMode = .scaleAspectFill
        posterImage.clipsToBounds = true
        
        // Setup Title Label View
        titleLabel.font = .fontMedium(17)
        titleLabel.numberOfLines = 3
        
        // Setup Release Date Label View
        releaseDateLabel.font = .font(14)
        releaseDateLabel.numberOfLines = 1
        releaseDateLabel.textColor = .darkGray
        
        // Setup Overview Label View
        overviewLabel.font = .font(14)
        overviewLabel.numberOfLines = 0
        overviewLabel.textColor = .darkGray
    }
}
