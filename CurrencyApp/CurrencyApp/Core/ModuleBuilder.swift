//
//  ModuleBuilder.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 31.05.2022.
//

import Foundation
import UIKit

final class ModulBuilder {
    private let images = [
        UIImage(systemName: "chart.line.uptrend.xyaxis"),
        UIImage(systemName: "star"),
        UIImage(systemName: "magnifyingglass")
    ]
    
    private init() {}
    
    private lazy var network: NetworkService = {
        Network()
    }()
    
    let favouriteService: FavouriteServiceProtocol = FavouriteLocalService() 
    
    static let shared: ModulBuilder = .init()
    
    
    private func networkService() -> NetworkService {
        network
    }
    
    func stocksModule() -> UIViewController {
        let presenter = StockPresenter(service: stockService())
        let view = StockViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
    private func stockService() -> StockServiceProtocol {
        StockService(client: network)
    }
    
    private func favouriteViewController() -> UIViewController {
        let presenter = FavouritePresenter(service: stockService())
        let view = FavouriteViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    private func searchViewController() -> UIViewController {
        SearchViewController()
    }
    
    
    func tabbarController() -> UIViewController {
        let tabbar = UITabBarController()
        let stocksVC = stocksModule()
        stocksVC.tabBarItem = UITabBarItem(title: "Stocks", image: nil, tag: 0)
        
        let favouriteVC = favouriteViewController()
        favouriteVC.tabBarItem = UITabBarItem(title: "Favourite", image: nil, tag: 0)
        
        let searchVC = searchViewController()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 0)
        
        
        tabbar.viewControllers = [stocksVC, favouriteVC, searchVC].map {
            UINavigationController(rootViewController: $0)
        }
        
        
        
        return tabbar
    }
}
