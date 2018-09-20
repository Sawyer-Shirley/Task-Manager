//
//  Manager Class.swift
//  Task Manager Project
//
//  Created by Sawyer Shirley on 9/18/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

class Manager {
    //This array will hold all of our tasks.
    var arrayOfTasks: [Task] = [Task(name: "Go Shopping", taskDetails: "Get: Eggs, Milk, Cheese, Beef"), Task(name: "Clean", taskDetails: "Clean room")]
    
    //Lists the tasks that are not completed.
    func listUnfinishedTasks() {
        print("Unfinished Tasks:\n")
        for task in arrayOfTasks {
            if task.priority == true {
                print("- \(task.name)")
            }
        }
        for task in arrayOfTasks{
            if task.priority == false {
                print("- \(task.name)")
            }
            
            if let completeBy = task.completeBy {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MM/dd/yyyy"
                print("\(task.name) (Description: \(task.taskDetails)) is due on: \(dateFormatter.string(from: completeBy))")
            }
        }
        sleep(1)
        print("Returning to menu...\n")
        sleep(1)
    }
 
    
    //Allows user to mark a task as complete.
    func markTaskComplete() {
        for index in 0..<arrayOfTasks.count {
            if arrayOfTasks[index].completed == false {
                print("\(index). \(arrayOfTasks[index].name)")
            }
        }
        print("Please enter the number of the task you would like to mark as complete:")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Try again.")
            userInput = Int(readLine()!)
        }
        arrayOfTasks[userInput!].completed = true
        
        //We need to remove the completeBy date, since this task is going to be marked complete.
        arrayOfTasks[userInput!].completeBy = nil
        
        print("Successfully marked task as complete!")
        sleep(1)
        
        
        print("Returning to the menu...\n")
        sleep(1)
    }

    
    //Allows a user to check out a game.
    func markTaskUncomplete() {
        print("List of completed tasks:")
        for index in 0..<arrayOfTasks.count {
            if arrayOfTasks[index].completed == true {
                print("\(index). \(arrayOfTasks[index].name)")
            }
        }
        print("Please enter the number of the task you wish to mark as uncomplete:")
        var userInput = Int(readLine()!)
        let validTaskIndex = Array(0..<arrayOfTasks.count)
        
        while userInput == nil || !validTaskIndex.contains(userInput!) {
            print("Invalid input. Try again.")
            userInput = Int(readLine()!)
        }
        //Change the completed value of our task element at the index provided by the user.
        arrayOfTasks[userInput!].completed = false
        
        print("Successfully marked task as uncomplete!")
        sleep(1)
        
        //Use calendar to add time and establish date to complete the task by
        let currentCalendar = Calendar.current
        let completeBy = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        arrayOfTasks[userInput!].completeBy = completeBy
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("Task is scheduled to be completed by: \(dateFormatter.string(from: completeBy!))")
        
        sleep(2)
        print("Returning to the menu...\n")
        sleep(1)
    }

    
    //Allows a user to remove a selected task.
    func removeTask() {
        
        //List all of the tasks with a number for the user to select
        for index in 0..<arrayOfTasks.count {
            print("\(index). \(arrayOfTasks[index].name)")
        }
        print("Please enter the number for the task you wish to remove:")
        
        var userInput = Int(readLine()!)
        let validTaskIndex = Array(0..<arrayOfTasks.count)
        
        while userInput == nil || !validTaskIndex.contains(userInput!) {
            print("Invalid input. Try again.")
            userInput = Int(readLine()!)
        }
        sleep(1)
        print("Successfully removed task!")
        arrayOfTasks.remove(at: userInput!)
        
        sleep(1)
        print("Returning to the menu...\n")
        sleep(1)
    }
   
    
    //Allows a user to add a new task.
    func createTask() {
        
        //Prompt user to enter a name for a new task
        print("Please enter the name of the task you wish to add:")
        
        //Get name input and store in variable
        var newTaskName = readLine()
        
        while newTaskName == nil || newTaskName == "" {
            print("Loading...")
            sleep(1)
            print("Invalid input. Please enter the task's name:")
            newTaskName = readLine()
        }
        print("Success!")
        sleep(1)
        //Prompt the user to enter details about the new task
        print("Please enter some details about the new task:")
        
        //Gather the task details and store them in a new variable
        var newTaskDetails = readLine()
        //Since the task details could basically be anything the user wishes, we do not need input validation.
        
        //Instantiate a new task with the name and details from user input.
        let newTask = Task(name: newTaskName!, taskDetails: newTaskDetails!)
        
        //Add new task object to our array
        arrayOfTasks.append(newTask)
        
        //Use calendar to add time and establish date to complete the task by
        let currentCalendar = Calendar.current
        let completeBy = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        newTask.completeBy = completeBy
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("Task is scheduled to be completed by: \(dateFormatter.string(from: completeBy!))")
        
        sleep(2)
        print("Returning to the menu...\n")
        sleep(1)
    }

    
    //Lists all complete tasks for the user.
    func listCompleteTasks() {
        print("Loading...")
        sleep(1)
        print("Complete Tasks:\n")
        for task in arrayOfTasks {
            if task.priority == true {
                print("- \(task.name)")
            }
        }
        for task in arrayOfTasks{
            if task.priority == false {
                print("- \(task.name)")
            }
        }
        sleep(1)
        print("Returning to the menu...\n")
        sleep(1)
    }
    
    
    //Lists all tasks, completed and uncomplete.
    func listAllTasks() {
        print("Loading...")
        sleep(1)
        print("All Tasks:\n")
        for task in arrayOfTasks {
            if task.priority == true {
                print("- \(task.name)")
            }
        }
        for task in arrayOfTasks{
            if task.priority == false {
                print("- \(task.name)")
            }
        }
        sleep(1)
        print("Returning to the menu...\n")
        sleep(1)
    }
    
    
    //Marks a task as priority.
    func markAsPriority() {
        for index in 0..<arrayOfTasks.count {
            if arrayOfTasks[index].priority == false {
                print("\(index). \(arrayOfTasks[index].name)")
            }
        }
        print("Please enter the number of the task you would like to mark as a priority:")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Try again.")
            userInput = Int(readLine()!)
        }
        arrayOfTasks[userInput!].priority = true
        for index in 0..<arrayOfTasks.count {
            if arrayOfTasks[index].priority == true {
                arrayOfTasks[index].name = "* \(arrayOfTasks[index].name)"
                print("Processing...")
                sleep(1)
                print("The task you have chosen will is now marked as a priority. This is shown by the * at the begining of the task's name.")
                sleep(3)
                print("Returning to the menu...\n")
                sleep(1)
            }
        }
    }
    
    
    //Something green lurks this way...
    func help() {
        print("sssssssstttt...")
        sleep(1)
        print("BOOM!")
        print("Player was blown up by a creeper.")
        sleep(1)
        print("Respawning...\n")
        sleep(1)
    }
    
}
