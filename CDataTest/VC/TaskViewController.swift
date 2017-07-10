//
//  TaskViewController.swift
//  CDataTest
//
//  Created by AJESHKUMAR CHEMPANKULAM DIVAKARAN on 08/07/17.
//  Copyright © 2017 donpaulpm. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet weak var textFld: UITextField!
    

    @IBOutlet weak var isOn: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnAct(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = textFld.text!
        task.isImportant = isOn.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("sucess")
        navigationController?.popViewController(animated: true)
        
    }
  

}
