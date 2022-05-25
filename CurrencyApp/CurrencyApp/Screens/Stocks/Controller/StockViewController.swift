//
//  StockViewController.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 24.05.2022.
//

import UIKit

final class StockViewController: UIViewController {
    private let model = ModelItem.getINSTANCE()
    
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
    }
    func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        
        
        view.addSubview(tableView)
    
        setupConstraints()
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

extension StockViewController: UITableViewDelegate {
    
}
extension StockViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StockCell.typeName, for: indexPath) as! StockCell        
        
        let item = model.items[indexPath.row]
        
        cell.iconView.image = UIImage(named: item.image)
        cell.symbolLabel.text = item.symbol
        cell.nameLabel.text = item.name
        cell.changedLabel.text = item.changed
        cell.priceLabel.text = item.price
        
        //indexPath.row % 2 == 0
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = UIColor(red: 0.94, green: 0.96, blue: 0.97, alpha: 1.0)
        }
        return cell
    }
}
