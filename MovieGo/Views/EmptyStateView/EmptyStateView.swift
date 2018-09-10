//
//  EmptyStateView.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

class EmptyStateView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "EmptyStateView"
    }
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
    
    func setLabel(text: String) {
        label.text = text
    }
}
