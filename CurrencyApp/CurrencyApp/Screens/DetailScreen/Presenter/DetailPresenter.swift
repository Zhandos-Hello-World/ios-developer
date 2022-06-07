//
//  DetailPresenter.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 01.06.2022.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    func updateView()
    func updateView(withLoader isLoading: Bool)
    func updateView(withError message: String)
}

protocol DetailPresenterProtocol {
    var view: DetailViewProtocol? { get set }
    var stockItem: StockItemModelProtocol { get }
    
    func loadView()
    
    func loadView(id: String, currency: String, days: String)
    
    func model() -> StockItemModelProtocol
    
    
    func getDetail() -> DetailItem?
}

final class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    
    private let service: DetailServiceProtocol
    
    private var detail: DetailItem? = nil
    
    let stockItem: StockItemModelProtocol
    
    init(service: DetailServiceProtocol, stockItem: StockItemModelProtocol) {
        self.service = service
        self.stockItem = stockItem
    }
    
    func loadView() {
    }
    
    func loadView(id: String, currency: String, days: String) {
        view?.updateView(withLoader: true)
        service.getStocks(currency: currency, id: id, days: days) { [weak self] result in
            self?.view?.updateView(withLoader: false)
            switch result {
            case .success(let details):
                self?.detail = details
                self?.view?.updateView()
            case .failure(let error):
                self?.view?.updateView(withError: error.localizedDescription)
            }
        }
    }
    func model() -> StockItemModelProtocol {
        return stockItem
    }
    func getDetail() -> DetailItem? {
        return detail
    }
}
