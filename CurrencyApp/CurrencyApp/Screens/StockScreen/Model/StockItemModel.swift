//
//  Item.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 25.05.2022.
//

import Foundation
import UIKit

protocol StockItemModelProtocol {
    var id: String { get }
    var name: String { get }
    var iconURL: String { get }
    var symbol: String { get }
    var price: String { get }
    var change: String { get }
    var changeColor: UIColor { get }
    var isFavourite: Bool { get set }
    
    func setFavourite()
}

final class StockItemModel: StockItemModelProtocol {
    
    private let stock: StockItem
    private let favouriteService: FavouriteServiceProtocol
    
    init(stock: StockItem) {
        self.stock = stock
        self.favouriteService = ModulBuilder.shared.favouriteService
        isFavourite = favouriteService.isFavourite(for: id)
    }
    
    var id: String {
        stock.id
    }
    
    var name: String {
        stock.name
    }
    
    var iconURL: String {
        stock.image
    }
    
    var symbol: String {
        stock.symbol
    }
    
    var price: String {
        stock.getPrice()
    }
    
    var change: String {
        stock.showChange()
    }
    
    var changeColor: UIColor {
        stock.change >= 0 ? .green : .red
    }
    
    var isFavourite: Bool = false
    
    func setFavourite() {
        isFavourite.toggle()
        
        if isFavourite {
            favouriteService.save(id: id)
        }
        else {
            favouriteService.remove(id: id)
        }
        
    }
}
