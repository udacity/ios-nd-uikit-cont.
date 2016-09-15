//
//  StoryNode.swift
//  MYOA
//
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

// MARK: - StoryNode

struct StoryNode {
    
    // MARK: Properties
    
    var message: String
    private var adventure: Adventure
    private var connections: [Connection]
    var imageName: String? {
        return adventure.credits.imageName
    }
    
    // MARK: Initializer
    
    init(dictionary: [String : AnyObject], adventure: Adventure) {
        
        self.adventure = adventure
        
        message = dictionary["message"] as! String
        connections = [Connection]()
        
        message = message.replacingOccurrences(of: "\\n", with: "\n\n")
        
        if let connectionsArray = dictionary["connections"] as? [[String : String]] {
            for connectionDictionary: [String : String] in connectionsArray {
                connections.append(Connection(dictionary: connectionDictionary))
            }
        }
    }
    
    // MARK: Prompt
    
    // The number of prompts for story choices
    func promptCount() -> Int {
        return connections.count
    }
    
    // The prompt string, these will be something like: "Open the door, and look inside"
    
    func promptForIndex(_ index: Int) -> String {
        return connections[index].prompt
    }
    
    // MARK: Story Node
    
    // The Story node that corresponds to the prompt with the same index.
    func storyNodeForIndex(index: Int) -> StoryNode {
        let storyNodeName = connections[index].connectedStoryNodeName
        let storyNode = adventure.storyNodes[storyNodeName]
        return storyNode!
    }
}
