//
//  FavouritePresenter.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 03.06.2022.
//

import Foundation


protocol FavouriteViewProtocol: AnyObject {
    
    func updateView()
    
    func updateView(withLoader isLoading: Bool)
    
    func updateView(withError message: String)
}

protocol FavouritePresenterProtocol {
    var view: FavouriteViewProtocol? { get set }
    var itemsCount: Int { get }
    
    func loadView()
    
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
    func model(for indexPath: IndexPath) -> StockItemModelProtocol {
        stocks[indexPath.row]
    }
}
