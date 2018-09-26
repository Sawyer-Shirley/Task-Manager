//
//  Task Manager.swift
//  Task Manager Project
//
//  Created by Sawyer Shirley on 9/17/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

//This file will hold all of the menu options.

class managerMenu {
    
    let taskManager = Manager()
    
    var shouldQuit = false //When this is true, we should quit running the program.
    
    func go() {
        //This function is going to make the menu run. It will display the menu and take user input until the user wishes to quit the app.
        while !shouldQuit {
            printMenu()
            var input = getInput()
            //We need input validation to make sure the value falls between 1 & 8
            handleInput(input)
        }
    }
    
    func validateInput(_ input: String) -> Bool {
        let validMenuOptions = Array(1...10)
        guard let number = Int(input) else {
            return false
        }
        return validMenuOptions.contains(number)
    }
    
    func printMenu() { //Lists the options for the user to select.
        print("""
Select an Option:
        1) Add Task
        2) Remove Task
        3) List All Tasks
        4) List Unfinished Tasks
        5) List Finished Tasks
        6) Mark A Task as Complete
        7) Mark A Complete Task as Uncomplete
        8) Mark A Task as Priority
        9) Quit
            ...

        Select 1-9
""")
        
    }
    
    func handleInput(_ input: String) { //Allows the user to select a specfic option.
        switch input {
        case "1":
            //call the library's add task function
            taskManager.createTask()
        case "2":
            //Call the library's remove task function.
            taskManager.removeTask()
        case "3":
            //List all tasks
            taskManager.listAllTasks()
        case "4":
            //List unfinished tasks
            taskManager.listUnfinishedTasks()
        case "5":
            //List finished tasks
            taskManager.listCompleteTasks()
        case "6":
            //Mark A Task as Complete
            taskManager.markTaskComplete()
        case "7":
            //Mark A Complete Task as Uncomplete
            taskManager.markTaskUncomplete()
        case "8":
            //Marks a task as priority
            taskManager.markAsPriority()
        case "9":
            //quit
            quit()
        case "10":
            //help ;)
            taskManager.help()
        default:
            break
        }
        
    }
    
    func quit() {
        //This function will be called when the user is ready to quit the app.
        shouldQuit = true
        //Show user a message.
        print("It is dangerous to go alone!")
        print("Thanks for using the Task Manager!")
    }
    
    func getInput() -> String {
        var userInput = readLine()
        
        while userInput == nil || userInput == "" {
            print("Loading...")
            sleep(1)
            print("Invalid input")
            userInput = readLine()
            
        }
        
        return userInput!
    }
}




