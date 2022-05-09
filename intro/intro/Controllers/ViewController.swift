//
//  ViewController.swift
//  intro
//
//  Created by Zhandos Baimurat on 09.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberClick(_ sender: UIButton) {
        userTextField.text! += String(sender.tag)
    }
    
    @IBAction func operationClick(_ sender: UIButton) {
        var value = ""
        switch sender.tag {
        case -1: value = "+"; break
        case -2: value = "-"; break
        case -3: value = "x"; break
        case -4: value = "/"; break
        default:
            print("Error")
        }
        userTextField.text! += value
    }
    
    @IBAction func clearClcik(_ sender: UIButton) {
        userTextField.text = ""
    }
    
    @IBAction func removeClick(_ sender: UIButton) {
        let value = userTextField.text ?? ""
        if !value.isEmpty {
            userTextField.text = String(value.prefix(value.count - 1))
        }
    }

}


