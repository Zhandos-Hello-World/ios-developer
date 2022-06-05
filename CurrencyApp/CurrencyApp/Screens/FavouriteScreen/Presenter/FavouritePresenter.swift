//
//  FavouritePresenter.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 03.06.2022.
//

import Foundation


protocol FavouriteViewProtocol: AnyObject {
    
    func updateView()
    
    func updateCell(for indexPath: IndexPath)
    
    func updateView(withLoader isLoading: Bool)
    
    func updateView(withError message: String)
}

protocol FavouritePresenterProtocol {
    var view: FavouriteViewProtocol? { get set }
    var itemsCount: Int { get }
    
    func loadView()
    
    func updateData()
    
    func model(for indexPath: IndexPath) -> StockItemModelProtocol
}

final class FavouritePresenter: FavouritePresenterProtocol {
    
    var view: FavouriteViewProtocol?
    
    var itemsCount: Int { stocks.count }
    
    private let service: StockServiceProtocol
    private let favouriteService = ModulBuilder.shared.favouriteService
    
    private var stocks: [StockItemModel] = []
    
    init(service: StockServiceProtocol) {
        self.service = service
    }

    
    func loadView() {
        startFavoritesNotificationObserving()
        view?.updateView(withLoader: true)
        service.getStocks { [weak self] result in
            self?.view?.updateView(withLoader: false)
            
            switch result {
            case .success(let stocks):
                self?.stocks = stocks.map { StockItemModel(stock: $0 )}.filter{ self?.favouriteService.isFavourite(for: $0.id) ?? false}
                self?.view?.updateView()
            case .failure(let error):
                self?.view?.updateView(withError: error.localizedDescription)
            }
        }
    }

    func updateData() {
        self.stocks = self.stocks.filter { $0.isFavourite == true}
    }
    
    
    
    func model(for indexPath: IndexPath) -> StockItemModelProtocol {
        stocks[indexPath.row]
    }
}
extension FavouritePresenter: FavoritesUpdateServiceProtocol {
    func setFavorite(notification: Notification) {
        guard let id = notification.stockId,
              let index = stocks.firstIndex(where: { $0.id == id }) else { return }
        
        let indexPath = IndexPath(row: index, section: 0)
        
        view?.updateCell(for: indexPath)
 
    }
}

