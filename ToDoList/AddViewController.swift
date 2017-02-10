//
//  AddViewController.swift
//  ToDoList
//
//  Created by Andreas Schiller on 09.02.17.
//  Copyright © 2017 Schiller. All rights reserved.
//

import UIKit
import CoreData

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var textNameField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func addTapped(_ sender: AnyObject) {
        // Create a Task from the outlet information
        
        let mgdContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: mgdContext)
        task.name = textNameField.text!
        task.important = importantSwitch.isOn
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Pop back
        
        navigationController!.popViewController(animated: true)
    }


}
