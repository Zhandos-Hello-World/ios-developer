//
//  ModelItem.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 25.05.2022.
//

import Foundation


final class ModelStockItem {
    private static let model = ModelStockItem()
    
    var items: [StockItem] = []
    
    static func getINSTANCE() -> ModelStockItem {
        return model
    }
}
