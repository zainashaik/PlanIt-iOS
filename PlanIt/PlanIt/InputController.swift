//
//  ViewController.swift
//  PlanIt
//
//  Created by Zaina Shaik on 7/11/19.
//  Copyright © 2019 Zaina Shaik. All rights reserved.
//

import CoreData
import UIKit

class InputController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var inputField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputField.delegate = self
    }
    
    
    @IBAction func submitTask(_ sender: Any) {
        guard inputField.text != "" else { return }
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let newTask = Task(context: context)
        newTask.name = inputField.text
        
        delegate.saveContext()
        inputField.text = ""
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    override func resignFirstResponder() -> Bool {
        return true
    }*/

}

