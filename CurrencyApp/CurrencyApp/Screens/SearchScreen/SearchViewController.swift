//
//  SearchViewController.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 27.05.2022.
//

import Foundation
import UIKit


class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Search"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
