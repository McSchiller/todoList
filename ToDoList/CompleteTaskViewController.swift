//
//  CompleteTaskViewController.swift
//  ToDoList
//
//  Created by Andreas Schiller on 09.02.17.
//  Copyright © 2017 Schiller. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
   
    @IBOutlet weak var taskLabel: UILabel!
    var task = Task()
    var previousVC = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func completeTabbed(_ sender: Any) {
     previousVC.tasks.remove(at: previousVC.selectedTask)
        previousVC.myTableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
}
