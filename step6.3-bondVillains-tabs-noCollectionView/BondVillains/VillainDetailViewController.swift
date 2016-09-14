//
//  VillainDetailViewController.swift
//  BondVillains
//
//  Created by Jason on 12/12/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - VillainDetailViewController: UIViewController

class VillainDetailViewController: UIViewController {

    // MARK: Properties
    
    var villain: Villain!
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    // MARK: Life Cycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.label.text = self.villain.name
        self.tabBarController?.tabBar.hidden = true        
        self.imageView!.image = UIImage(named: villain.imageName)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.hidden = false
    }
}
