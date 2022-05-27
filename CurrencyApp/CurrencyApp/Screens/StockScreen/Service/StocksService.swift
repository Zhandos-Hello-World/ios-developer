//
//  StocksService.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 27.05.2022.
//

import Foundation
//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=100

enum StockRouter: Router {
    case stocks(currency: String, count: String)
    
    var baseUrl: String {
        "https://api.coingecko.com"
    }
    
    var path: String {
        switch self {
        case .stocks:
            return "/api/v3/coins/markets"
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .stocks:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .stocks(let currency, let count):
            return ["vs_currency": currency, "per_page": count]
        }
    }

}

protocol StockServiceProtocol {
    func getStocks(currency: String, count: String, completion: @escaping (Result<[StockItem], NetworkError>) -> Void)
    
    func getStocks(currency: String, completion: @escaping (Result<[StockItem], NetworkError>) -> Void)
    func getStocks(completion: @escaping (Result<[StockItem], NetworkError>) -> Void)
    
}
extension StockServiceProtocol {
    
    func getStocks(currency: String, completion: @escaping (Result<[StockItem], NetworkError>) -> Void) {
        getStocks(currency: currency, count: "100", completion: completion)
    }
    
    func getStocks(completion: @escaping (Result<[StockItem], NetworkError>) -> Void) {
        getStocks(currency: "usd", completion: completion)
    }
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
