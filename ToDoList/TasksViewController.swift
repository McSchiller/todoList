//
//  TasksViewController.swift
//  ToDoList
//
//  Created by Andreas Schiller on 09.02.17.
//  Copyright © 2017 Schiller. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var tasks : [Task] = []
    var selectedTask = 0
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        
        print(myTableView)
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else{
            cell.textLabel?.text = "\(task.name)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTask = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    @IBAction func addTabbed(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
            
        }
        if segue.identifier! == "addTask"{
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
            
        }
        
    }
    
    func makeTasks() -> [Task]{
        let task1 = Task()
        task1.name = "Mit Hund spazieren gehen"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Mit Katze spazieren gehen"
        task2.important = false
        
        let task3 = Task()
        task3.name = "Milch kaufen"
        task3.important = true
        
        return [task3,task2,task1]
    }
    
   
   
    


}

