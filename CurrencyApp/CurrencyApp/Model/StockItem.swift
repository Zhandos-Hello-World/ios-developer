//
//  Item.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 25.05.2022.
//

import Foundation

struct StockItem: Decodable  {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let price: Double
    let change: Double
    let changePercentage: Double
    
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case price = "current_price"
        case change = "price_change_24h"
        case changePercentage = "price_change_percentage_24h"
    }
}
