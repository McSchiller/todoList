//
//  AddViewController.swift
//  ToDoList
//
//  Created by Andreas Schiller on 09.02.17.
//  Copyright © 2017 Schiller. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var textNameField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func addTabbed(_ sender: UIButton) {
        // Create a Task from the outlet information
        
        let task = Task()
        task.name = textNameField.text!
        task.important = importantSwitch.isOn
        previousVC.tasks.append(task)
        previousVC.myTableView!.reloadData()
        
        navigationController!.popViewController(animated: true)
    }

}
