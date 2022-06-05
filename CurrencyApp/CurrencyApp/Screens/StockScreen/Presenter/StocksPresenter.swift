//
//  StocksPresenter.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 27.05.2022.
//

import Foundation

protocol StocksViewProtocol: AnyObject {
    func updateView()
    func updateCell(for indexPath: IndexPath)
    func updateView(withLoader isLoading: Bool)
    func updateView(withError message: String)
    
}


protocol StockPresenterProtocol {
    var view: StocksViewProtocol? { get set }
    var itemsCount: Int { get }

    func loadView()
    func model(for indexPath: IndexPath) -> StockItemModelProtocol
    
}


final class StockPresenter: StockPresenterProtocol {
    var itemsCount: Int { stocks.count }
    
    private let service: StockServiceProtocol
    weak var view: StocksViewProtocol?
    private var stocks: [StockItemModel] = []
    
    internal init(service: StockServiceProtocol) {
        self.service = service
    }
    
    func loadView() {
        startFavoritesNotificationObserving()
        
        view?.updateView(withLoader: true)
        service.getStocks { [weak self] result in
            self?.view?.updateView(withLoader: false)
            
            switch result {
            case .success(let stocks):
                self?.stocks = stocks.map { StockItemModel(stock: $0 )}
                self?.view?.updateView()
            case .failure(let error):
                self?.view?.updateView(withError: error.localizedDescription)
            }
        }
    }
    func model(for indexPath: IndexPath) -> StockItemModelProtocol {
        stocks[indexPath.row]
    }
}
extension StockPresenter: FavoritesUpdateServiceProtocol {
    func setFavorite(notification: Notification) {
        guard let id = notification.stockId,
              let index = stocks.firstIndex(where: { $0.id == id }) else { return }
        
        let indexPath = IndexPath(row: index, section: 0)
        
        view?.updateCell(for: indexPath)
 
    }
}
