//
//  ViewController.swift
//  ToDoList
//
//  Created by Zhandos Baimurat on 20.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let data = Data.getINSTANCE()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = "Todo list"
        print(data.items.count)
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    @IBAction func addAction() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "add") as! AddViewController
        
        vc.title = "Add task"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    }
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data.items[indexPath.row].name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.items.count
    }
}
