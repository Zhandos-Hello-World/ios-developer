//
//  StocksService.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 27.05.2022.
//

import Foundation


protocol StockServiceProtocol {
    func getStocks(currency: String, count: String, completion: @escaping (Result<[StockItem], NetworkError>) -> Void)
    
    func getStocks(currency: String, completion: @escaping (Result<[StockItem], NetworkError>) -> Void)
    
    func getStocks(completion: @escaping (Result<[StockItem], NetworkError>) -> Void)
    
}

final class StockService: StockServiceProtocol {
    private let client: NetworkService
    
    init(client: NetworkService) {
        self.client = client
    }
    
    func getStocks(currency: String, count: String, completion: @escaping (Result<[StockItem], NetworkError>) -> Void) {
        client.execute(with: StockRouter.stocks(currency: currency, count: count), completion: completion)
    }
}

extension StockServiceProtocol {
    
    func getStocks(currency: String, completion: @escaping (Result<[StockItem], NetworkError>) -> Void) {
        getStocks(currency: currency, count: "100", completion: completion)
    }
    
    func getStocks(completion: @escaping (Result<[StockItem], NetworkError>) -> Void) {
        getStocks(currency: "usd", completion: completion)
    }
}

