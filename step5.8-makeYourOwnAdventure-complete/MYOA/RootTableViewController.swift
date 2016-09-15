//
//  RootTableViewController.swift
//  MYOA
//
//  Created by Jarrod Parkes on 11/3/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - RootTableViewController: UITableViewController

class RootTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var adventures = [Adventure]()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Initialize the Adventures
        let adventurePlistPaths = Bundle.main.paths(forResourcesOfType: "plist", inDirectory: nil)
        
        for plistPath in adventurePlistPaths {
            
            if (plistPath as NSString).lastPathComponent != "Info.plist" {
                if let adventureDictionary = NSDictionary(contentsOfFile: plistPath) as? [String : AnyObject] {
                    adventures.append(Adventure(dictionary: adventureDictionary))
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }

    // MARK: UITableViewController
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adventures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let adventure = adventures[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = adventure.credits.title
        cell.detailTextLabel!.text = adventure.credits.author
        let imageName = adventure.credits.imageName
        cell.imageView!.image = UIImage(named: imageName!)
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get the selected adventure
        let selectedAdventure = adventures[(indexPath as NSIndexPath).row]
        
        // Get the first node
        let firstNodeInTheAdventure = selectedAdventure.startNode

        // Get a StoryNodeController from the Storyboard
        let storyNodeController = self.storyboard!.instantiateViewController(withIdentifier: "StoryNodeViewController") as! StoryNodeViewController
        
        // Set the story node so that we will see the start of the story
        storyNodeController.storyNode = firstNodeInTheAdventure
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(storyNodeController, animated: true)
    }
}
