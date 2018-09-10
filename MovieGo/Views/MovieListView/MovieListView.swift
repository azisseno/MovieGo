//
//  MovieListView.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit
import SDWebImage

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
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupXIB()
        view?.prepareForInterfaceBuilder()
    }
    
    func set(posterPath: String?,
             title: String,
             releaseDateLabel: String,
             overview: String) {
        
    }
}
