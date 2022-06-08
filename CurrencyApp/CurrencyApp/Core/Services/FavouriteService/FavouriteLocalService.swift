//
//  FavouriteService.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 03.06.2022.
//

import Foundation


class FavouriteLocalService: FavouriteServiceProtocol {
    private lazy var path: URL = {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("Favourites")
    }()
    private lazy var favouriteIds:[String] = {
        do {
            let data = try Data(contentsOf: path)
            return try JSONDecoder().decode([String].self, from: data)
        } catch {
            print("FileManager WriterError - ", error.localizedDescription)
        }
        return []
    }()
    
    func save(id: String) {
        favouriteIds.append(id)
        updateRepo(with: id)
    }
    
    func remove(id: String) {
        if let index = favouriteIds.firstIndex(where: { $0 == id }) {
            favouriteIds.remove(at: index)
        }
        updateRepo(with: id)
    }
    
    func isFavourite(for id: String) -> Bool {
        favouriteIds.contains(id)
    }
    
    private func updateRepo(with id: String) {
        do {
            let data = try JSONEncoder().encode(favouriteIds)
            try data.write(to: path)
            NotificationCenter.default.post(name: NSNotification.Name("Update.Favorite.Stocks"),
                                            object: nil,
                                            userInfo: ["id": id])
        } catch {
            print("FileManager WriterError - ", error.localizedDescription)
        }
     }
    
}
