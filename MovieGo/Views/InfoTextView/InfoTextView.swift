//
//  InfoTextView.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

class InfoTextView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "InfoTextView"
    }
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
        setupIcon()
    }
        
    func setupIcon() {
        icon.image = #imageLiteral(resourceName: "info_ico")
        icon.contentMode = .scaleAspectFit
    }
    
    func set(text: String) {
        self.label.text = text
    }
}
