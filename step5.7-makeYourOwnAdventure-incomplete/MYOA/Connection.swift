
//
//  Connection.swift
//  MYOA
//
//  Created by Jason on 1/17/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

// MARK: - Connection

struct Connection {

    // MARK: Properties
    
    var prompt: String
    var connectedStoryNodeName: String
    
    // MARK: Initializer
    
    init(dictionary: [String : String]) {
        prompt = dictionary["prompt"]!
        connectedStoryNodeName = dictionary["connectTo"]!
    }
}
