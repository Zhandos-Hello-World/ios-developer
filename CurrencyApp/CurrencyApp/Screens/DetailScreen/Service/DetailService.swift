//
//  DetailService.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 01.06.2022.
//

import Foundation


protocol DetailServiceProtocol {
    
    func getStocks(currency: String, id: String, days: String, interval: String, completion: @escaping (Result<DetailItem, NetworkError>) -> Void)
    
    func getStocks(currency: String, id: String, days: String, completion: @escaping (Result<DetailItem, NetworkError>) -> Void)

    func getStocks(currency: String, id: String, completion: @escaping (Result<DetailItem, NetworkError>) -> Void)
}


final class DetailService: DetailServiceProtocol {
    private let client: NetworkService
    
    init(client: NetworkService) {
        self.client = client
    }
    
    func getStocks(currency: String, id: String, days: String, interval: String, completion: @escaping (Result<DetailItem, NetworkError>) -> Void) {
        client.execute(with: DetailRouter.stocks(currency: currency, id: id, days: days, interval: interval), completion: completion)
    }
}



extension DetailServiceProtocol {
    
    func getStocks(currency: String, id: String, completion: @escaping (Result<DetailItem, NetworkError>) -> Void) {
        getStocks(currency: currency, id: id, days: "60", completion: completion)
    }
    
    func getStocks(currency: String, id: String, days: String, completion: @escaping (Result<DetailItem, NetworkError>) -> Void) {
        getStocks(currency: currency, id: id, days: days, interval: "daily", completion: completion)
    }
}
