//
//  RockPaperScissorsViewController.swift
//  RockPaperScissors
//
//  Created by Gabrielle Miller-Messner on 10/30/14.
//  Copyright (c) 2014 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

// MARK: - RockPaperScissorsViewController: UIViewController

class RockPaperScissorsViewController: UIViewController {
    
    // MARK: Properties
    
    var history = [RPSMatch]()
    
    // MARK: Outlets
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    // MARK: Actions
    
    @IBAction func makeYourMove(_ sender: UIButton) {
        
        switch (sender) {
        case self.rockButton:
            throwDown(RPS.rock)
            
        case self.paperButton:
            throwDown(RPS.paper)

        case self.scissorsButton:
            throwDown(RPS.scissors)
        
        default:
            assert(false, "An unknown button is invoking makeYourMove()")
        }
    }
    
    // MARK: Play!
    
    func throwDown(_ playersMove: RPS) {
        let computersMove = RPS()
        let match = RPSMatch(p1: playersMove, p2: computersMove)
        
        // Add match to the history
        history.append(match)
        
        // Get the Storyboard and ResultViewController
        let storyboard = UIStoryboard (name: "Main", bundle: nil)
        let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        // Communicate the match to the ResultViewController
        resultVC.match = match
        
        self.present(resultVC, animated: true, completion: nil)
    }
    
    // MARK: Actions
    
    @IBAction func showHistory(_ sender: AnyObject) {
        
        let storyboard = self.storyboard
        let controller = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController")as! HistoryViewController
        
        controller.history = self.history
        
        self.present(controller, animated: true, completion: nil)
    }
}
