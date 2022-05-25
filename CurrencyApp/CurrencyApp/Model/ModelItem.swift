//
//  ModelItem.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 25.05.2022.
//

import Foundation


class ModelItem {
    private static let model = ModelItem()
    
    var items: [Item] = [
        Item(image: "YNDX", symbol: "YNDX", name: "Yandex, LCC", price: "4 764,6 ₽", changed: "+55 ₽ (1,15%)"),
        Item(image: "AAPL", symbol: "AAPL", name: "Apple Inc.", price: "$131.93", changed: "+$0.12 (1,15%)"),
        Item(image: "GOOGL", symbol: "GOOGL", name: "Alphabet Class A", price: "$1 825", changed: "+$0.12 (1,15%)"),
        Item(image: "AMZN", symbol: "AMZN", name: "Amazon.com", price: "$3 204", changed: "+$0.12 (1,15%)"),
        Item(image: "BAC", symbol: "BAC", name: "Bank of America Corp", price: "$3 204", changed: "+$0.12 (1,15%)"),
        Item(image: "MSFT", symbol: "MSFT", name: "Microsoft Corporation", price: "$3 204", changed: "+$0.12 (1,15%)"),
        Item(image: "TSLA", symbol: "TSLA", name: "Tesla Motors", price: "$3 204", changed: "+$0.12 (1,15%)"),
        Item(image: "MA", symbol: "MA", name: "Mastercard", price: "$3 204", changed: "+$0.12 (1,15%)"),
    ]
    
    static func getINSTANCE() -> ModelItem {
        return model
    }
}
