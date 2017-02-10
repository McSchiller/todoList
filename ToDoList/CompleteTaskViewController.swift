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
    var task : Task? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task!.important {
            taskLabel.text = "❗️\(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
    }

    @IBAction func completeTabbed(_ sender: Any) {
        
        let manager = UIApplication.shared.delegate as! AppDelegate
        let context = manager.persistentContainer.viewContext
        
        context.delete(task!)
        manager.saveContext()
        
        navigationController!.popViewController(animated: true)
    }
}
