//
//  UIImageView.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit
import Kingfisher

enum PosterSize: String {
    case w92
    case w185
    case w500
    case w780
}

extension UIImageView {
    
    /// Load Poster Image
    ///
    /// - Parameters:
    ///   - placeholder: image placeholder while waiting downloading web asset
    ///   - path: Path from api
    ///   - posterSize: Poster size available: `w92`, `w185`, `w500`, `w700`
    func loadPoster(placeholder: UIImage? = nil,
                    path: String,
                    posterSize: PosterSize) {
        let urlString = Constant.imageBasePath + "/\(posterSize.rawValue)" + path
        let resource = ImageResource(downloadURL: URL(string: urlString)!)
        kf.setImage(with: resource,
                    placeholder: placeholder,
                    options: [.transition(.fade(0.2))])
        
    }
}
