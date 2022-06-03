//
//  DetailModule.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 01.06.2022.
//

import Foundation
import UIKit


final class DetailModule {
    private lazy var network: NetworkService = {
        Network()
    }()
    
    private func networkService() -> NetworkService {
        network
    }
    private func detailService() -> DetailServiceProtocol {
        DetailService(client: network)
    }
    
    func detailModule() -> UIViewController {
        let presenter = DetailPresenter(service: detailService())
        let view = DetailViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
