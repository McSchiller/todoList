//
//  TasksViewController.swift
//  ToDoList
//
//  Created by Andreas Schiller on 09.02.17.
//  Copyright © 2017 Schiller. All rights reserved.
//

import UIKit
import CoreData

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var tasks : [Task] = []
    var selectedTask = 0
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTask = indexPath.row
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    @IBAction func addTabbed(_ sender: Any) {
        performSegue(withIdentifier: "addTask", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
        }
        
    }
    
    func getTasks(){
        let mgdContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
           tasks = try mgdContext.fetch(Task.fetchRequest()) as! [Task]
        } catch{
            print("Database Error")
        }
       
    }
    
   
   
    


}

