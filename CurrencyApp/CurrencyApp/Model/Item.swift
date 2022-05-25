//
//  Item.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 25.05.2022.
//

import Foundation

class Item {
    var image: String = ""
    var symbol: String = ""
    var name: String = ""
    var price: String = ""
    var changed: String = ""
    
    init(image: String, symbol: String, name: String, price: String, changed: String) {
        self.image = image
        self.symbol = symbol
        self.name = name
        self.price = price
        self.changed = changed
    }
    
}
