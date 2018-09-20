//
//  Task Class.swift
//  Task Manager Project
//
//  Created by Sawyer Shirley on 9/17/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

//This file holds the Task class and all of its information.

class Task {
    var name: String //The name of the task
    var taskDetails: String //The description of the task
    var completed: Bool = false //If the task is completed, automatically set to false
    var completeBy: Date? //The complete by date.
    var priority: Bool = false //If the task is set as a priority task, normally set to false. This places the task at the top of all list functions and adds an * at the begining of it to make it stand apart.
    
    init(name: String, taskDetails: String) {
        self.name = name
        self.taskDetails = taskDetails
    }
}



