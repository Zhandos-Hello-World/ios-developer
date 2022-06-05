//
//  Assembly.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 05.06.2022.
//

import Foundation
import UIKit

final class Assembly {
    static let assembler: Assembly = .init()
    let favoritesService: FavouriteServiceProtocol = FavouriteLocalService()

    private init() {}

    private lazy var network: NetworkService = Network()
    private lazy var stocksService: StockServiceProtocol = StockService(client: network)

    
    private func stocksModule() -> UIViewController {
        let presneter = StockPresenter(service: stocksService)
        let view = StockViewController(presenter: presneter)
        presneter.view = view
        
        return view
    }
    
    func secondVC() -> UIViewController {
        UIViewController()
    }
    
    func thirdVC() -> UIViewController {
        UIViewController()
    }
    
    func tabbarController() -> UIViewController {
        let tabbar = UITabBarController()
        
        let stocksVC = UINavigationController(rootViewController: stocksModule())
        stocksVC.tabBarItem = UITabBarItem(title: "Stocks", image: .add, tag: 0)
        
        let secondVC = secondVC()
        secondVC.tabBarItem = UITabBarItem(title: "Favorites", image: nil, tag: 2)
        
        let thirdVC = thirdVC()
        thirdVC.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 2)
        
        tabbar.viewControllers = [stocksVC, secondVC, thirdVC]
        
        return tabbar
    }
    private func detailService() -> DetailServiceProtocol {
        DetailService(client: network)
    }
    
    func detailVC(model: StockItemModelProtocol) -> UIViewController {
        let presenter = DetailPresenter(service: detailService(), stockItem: model)
        let view = DetailViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
