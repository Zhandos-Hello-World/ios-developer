//
//  AddViewController.swift
//  ToDoList
//
//  Created by Zhandos Baimurat on 20.05.2022.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var field: UITextField!
    var data = Data.getINSTANCE()

    override func viewDidLoad() {
        super.viewDidLoad()

        field.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        
        return true
    }
    
    @IBAction func saveTask() {
        if (field.text!.isEmpty) {
            let alert = UIAlertController(title: "Invalid input", message: "Task is empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true)
        }
        else {
            data.items.append(Item(name: field?.text ?? ""))
            field.text = ""
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
