//
//  FavouriteStockViewController.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 27.05.2022.
//

import Foundation
import UIKit

class FavouriteViewController: UIViewController {
    private var stocks: [StockItem] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StockCell.self, forCellReuseIdentifier: StockCell.typeName)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setup()
        getStock()
    }
    func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        
        
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        setupConstraints()
    }
    
    func getStock() {
        let client = Network()
        let service: StockServiceProtocol = StockService(client: client)
        
        service.getStocks {[weak self] result in
            switch result {
            case .success(let stocks):
                self?.stocks = stocks
                self?.tableView.reloadData()
            case .failure(let error):
                self?.showError(error.localizedDescription)
            }
        }
    }
    
    func showError(_ message: String) {
        print(message)
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension FavouriteViewController: UITableViewDelegate {
}
extension FavouriteViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StockCell.typeName, for: indexPath) as? StockCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: stocks[indexPath.row], index: indexPath.row)
        return cell
    }
}
