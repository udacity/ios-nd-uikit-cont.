//
//  File.swift
//  RockPaperScissors
//
//  Created by Jason on 11/14/14.
//  Copyright (c) 2014 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var history: [RPSMatch]!
    
    // Table View Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let CellID = "HistoryCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) 
        
        let match = self.history[(indexPath as NSIndexPath).row]
        
        cell.textLabel!.text = victoryStatusDescription(match)
        cell.detailTextLabel!.text = "\(match.p1) vs. \(match.p2)"
                
        
        return cell
    }
    
    func victoryStatusDescription(_ match: RPSMatch) -> String {
        
        if (match.p1 == match.p2) {
            return "Tie."
        } else if (match.p1.defeats(match.p2)) {
            return "Win!"
        } else {
            return "Loss."
        }
    }
    @IBAction func dismissHistory(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}


