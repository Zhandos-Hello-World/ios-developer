//
//  MainTabBarViewController.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 27.05.2022.
//

import Foundation
import UIKit


class MainTabBarViewController: UITabBarController {
    private let images = [
        UIImage(systemName: "chart.line.uptrend.xyaxis"),
        UIImage(systemName: "star"),
        UIImage(systemName: "magnifyingglass")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stockViewController = StockViewController()
        let favouriteViewController = FavouriteViewController()
        let searchViewController = SearchViewController()
        
        
        setViewControllers([stockViewController, favouriteViewController, searchViewController], animated: true)
        
        guard let items = tabBar.items else {
            return
        }

        for x in 0..<images.count {
            items[x].image = images[x]
        }
    }
    
}
