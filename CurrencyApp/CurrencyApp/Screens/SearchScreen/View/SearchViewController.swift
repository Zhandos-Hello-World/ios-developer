//
//  SearchViewController.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 27.05.2022.
//

import Foundation
import UIKit

final class SearchViewController: UIViewController {
    private let presenter: SearchPresenterProtocol
    
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
    
    private lazy var searchField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 25.0
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.black.cgColor
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    private lazy var showLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Stocks"
        return label
    }()
    private lazy var showMoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Show more"
        return label
    }()
    
    
    init(presenter: SearchPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.loadView()
        setup()
    }
    
    func setup() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(searchField)
        view.addSubview(showLabel)
        view.addSubview(showMoreLabel)
        setupConstraints()
        
        title = "Search"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchField.heightAnchor.constraint(equalToConstant: 48.0),
            
            showLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            showLabel.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 24),
            
            showMoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            showMoreLabel.topAnchor.constraint(equalTo: showLabel.topAnchor),
            showMoreLabel.bottomAnchor.constraint(equalTo: showLabel.bottomAnchor),
            
            
            
    
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.topAnchor.constraint(equalTo: showLabel.bottomAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = presenter.model(for: indexPath)
        let detailVC = Assembly.assembler.detailVC(model: model)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
extension SearchViewController: StocksViewProtocol {
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

extension SearchViewController: UITableViewDataSource {

    
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
