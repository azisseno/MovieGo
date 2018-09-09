//
//  ViewController.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 08/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit
import Api

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testGetSearchMovie()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func testGetSearchMovie() {
        MovieServices.getSearchMovie(
            query: "Batman",
            page: 1,
            onSuccess: { movieResponse in

        },
            onFailure: { error in

        }
            ).call()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
