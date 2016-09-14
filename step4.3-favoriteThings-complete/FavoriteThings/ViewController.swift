//
//  ViewController.swift
//  FavoriteThings
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Model
    
    let favoriteThings: [String] = [
        "Raindrops on roses",
        "Whiskers on kittens",
        "Bright copper kettles",
        "Warm woolen mittens"
    ]
    
    // MARK: Table View Data Source Methods
    
    // number of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return self.favoriteThings.count
    }

    // cell for row at index path
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCellWithIdentifier("FavoriteThingCell")!
        let favoriteThingForRow = self.favoriteThings[indexPath.row]
        cell.textLabel?.text = favoriteThingForRow
        
        return cell

    }
}

