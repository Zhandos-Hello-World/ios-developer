//
//  StockViewController.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 24.05.2022.
//

import UIKit

final class StockViewController: UIViewController {
    private let presenter: StockPresenterProtocol
    
    
    init(presenter: StockPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StockCell.self, forCellReuseIdentifier: StockCell.typeName)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .white
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.loadView()
        setup()
    }
    
    func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupConstraints()
        
        title = "Stocks"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = presenter.model(for: indexPath)
        let detailVC = Assembly.assembler.detailVC(model: model)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
extension StockViewController: StocksViewProtocol {
    func updateCell(for indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func updateView() {
        tableView.reloadData()
    }
    
    func updateView(withLoader isLoading: Bool) {
        
    }
    
    func updateView(withError message: String) {
        
    }
    
    
}

extension StockViewController: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.itemsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StockCell.typeName, for: indexPath) as? StockCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: presenter.model(for: indexPath), index: indexPath.row)
        return cell
    }
}
/*{"id":"bitcoin",
 "symbol":"btc",
 "name":"Bitcoin",
 "image":"https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
 "current_price":29239,
 "market_cap":558493923485,
 "market_cap_rank":1,
 "fully_diluted_valuation":615669476681,
 "total_volume":22748927281,
 "high_24h":29978,
 "low_24h":29258,
 "price_change_24h":-518.1531826007013,
 "price_change_percentage_24h":-1.74128,
 "market_cap_change_24h":-8804658413.779297,
 "market_cap_change_percentage_24h":-1.55203,
 "circulating_supply":19049787.0,
 "total_supply":21000000.0,
 "max_supply":21000000.0,
 "ath":69045,
 "ath_change_percentage":-57.08429,
 "ath_date":"2021-11-10T14:24:11.849Z",
 "atl":67.81,
 "atl_change_percentage":43597.82249,
 "atl_date":"2013-07-06T00:00:00.000Z",
 "roi":null,
 "last_updated":"2022-05-26T08:37:54.690Z"
*/
