//
//  ViewFromNib.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 10/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

protocol ViewFromNib: class {
    var view: UIView? { get set }
    var nibName: String { get }
}

extension ViewFromNib where Self: UIView {
    
    func setupXIB() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view = view
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
    
    var nibName: String {
        return String(describing: self)
    }
}
