//
//  FavouriteServiceProtocol.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 05.06.2022.
//

import Foundation


protocol FavouriteServiceProtocol {
    
    func save(id: String)
    
    func remove(id: String)
        
    func isFavourite(for id: String) -> Bool

}
