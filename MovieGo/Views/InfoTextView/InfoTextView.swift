//
//  InfoTextView.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

@IBDesignable
class InfoTextView: UIView, ViewFromNib {
    
    var view: UIView?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
        setupIcon()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupXIB()
        setupIcon()
        view?.prepareForInterfaceBuilder()
    }
    
    func setupIcon() {
        icon.image = #imageLiteral(resourceName: "info_ico")
        icon.contentMode = .scaleAspectFit
    }
}
