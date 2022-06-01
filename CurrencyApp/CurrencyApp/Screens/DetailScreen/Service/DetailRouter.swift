//
//  DetailRouter.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 01.06.2022.
//

import Foundation


enum DetailRouter: Router {
    case stocks(currency: String, id: String, days: String, interval: String)
    
    var baseUrl: String {
        "https://api.coingecko.com"
    }
    
    var path: String {
        switch self {
        case .stocks(_, let id, _, _):
            return "/api/v3/coins/\(id)/market_chart"
            
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
        case .stocks(let currency, _, let days, let interval):
            return ["vs_currency": currency, "days": days, "interval": interval]
        }
    }

}
