//
//  main.swift
//  Task Manager Project
//
//  Created by Sawyer Shirley on 9/17/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

//This is where the Task Manager will be started from.

print("Welcome to your personal task manager!\n")

let menu = managerMenu()

while !menu.shouldQuit {
menu.go()
}

