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

    func loadView()
    
    func loadView(id: String, currency: String)
    
    func model() -> DetailItem
}

final class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    
    private let service: DetailServiceProtocol
    
    private var detail: DetailItem? = nil
    
    init(service: DetailServiceProtocol) {
        self.service = service
    }
    
    func loadView() {
        print("Nothing")
    }
    
    func loadView(id: String, currency: String) {
        view?.updateView(withLoader: true)
        service.getStocks(currency: currency, id: id) { [weak self] result in
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
    func model() -> DetailItem {
        guard let detail = detail else {
            return DetailItem()
        }
        return detail
    }
}
