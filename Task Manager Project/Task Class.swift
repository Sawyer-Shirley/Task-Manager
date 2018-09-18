//
//  Task Class.swift
//  Task Manager Project
//
//  Created by Sawyer Shirley on 9/17/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

//This file holds the File class.

class Task {
    let name: String
    let taskDetails: String
    var completed: Bool = false
    var completeBy: Date?
    
    init(name: String, taskDetails: String) {
        self.name = name
        self.taskDetails = taskDetails
    }
}



