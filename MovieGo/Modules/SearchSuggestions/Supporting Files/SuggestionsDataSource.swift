//
//  SuggestionsDataSource.swift
//  MovieGo
//
//  Created by Azis Senoaji Prasetyotomo on 11/09/18.
//  Copyright © 2018 Azisseno. All rights reserved.
//

import UIKit

class SuggestionsDataSource: NSObject, UITableViewDataSource {
    
    var suggestions: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "suggestionCell", for: indexPath)
        cell.textLabel?.text = "Test"
//        cell.textLabel?.text = suggestions[indexPath.row]
        return cell
    }
}
