//
//  ViewController.swift
//  Paint
//
//  Created by Zhandos Baimurat on 13.05.2022.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var paintView: PaintView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func circle(_ sender: Any) {
        paintView.createCircle()
    }
    
    @IBAction func rect(_ sender: Any) {
        paintView.createRectangle()
    }
        
    @IBAction func triangle(_ sender: Any) {
        paintView.createTriangle()
    }
}

