//
//  DetailViewController.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 27.05.2022.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    private lazy var toolbar: UIView = {
        let toolbar = UIView()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
//        toolbar.layer.shadowColor = UIColor.black.cgColor
//        toolbar.layer.shadowOpacity = 0.6
//        toolbar.layer.shadowOffset = .zero
//        toolbar.layer.shadowRadius = 10.0
//
//        toolbar.layer.shadowPath = UIBezierPath(rect: toolbar.bounds).cgPath
//        toolbar.layer.shouldRasterize = true
        
        return toolbar
    }()
    
    private lazy var leaveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var favouriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "AAPL"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Apple Inc."
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = "$131.93"
        return label
    }()
    
    private lazy var changedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        //#24B25D
        label.text = "+$0.12 (1,15%)"
        label.textColor = UIColor(red: 0.14, green: 0.70, blue: 0.36, alpha: 1.00)
        return label
    }()
    
    private lazy var buyButton: UIButton = {
        
        let button = UIButton(configuration: selectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buy for $132.04", for: .normal)
    
        return button
    }()
    
    private lazy var selectedConfig: UIButton.Configuration = {
        var filled = UIButton.Configuration.filled()
        filled.buttonSize = .large
        filled.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
        filled.baseBackgroundColor = .black
        filled.cornerStyle = .medium
        
        return filled
    }()
    private lazy var unSelectedConfig: UIButton.Configuration = {
        var filled = UIButton.Configuration.filled()
        filled.buttonSize = .large
        filled.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
        filled.baseBackgroundColor = UIColor(red: 0.941, green: 0.955, blue: 0.97, alpha: 1)
        filled.cornerStyle = .medium
        filled.baseForegroundColor = .black
        return filled
    }()
    
    
    private lazy var dayButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("D", for: .normal)
        return button
    }()
    
    private lazy var weakButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("W", for: .normal)
        return button
    }()
    
    private lazy var monthButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("D", for: .normal)
        return button
    }()

    private lazy var halfYearButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("6M", for: .normal)
        return button
    }()
    
    private lazy var yearButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Y", for: .normal)
        return button
    }()
    
    private lazy var allButton: UIButton = {
        let button = UIButton(configuration: selectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ALL", for: .normal)
        return button
    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setup()
    }
    func setup() {
        view.addSubview(toolbar)
        
        toolbar.addSubview(favouriteButton)
        toolbar.addSubview(leaveButton)
        toolbar.addSubview(titleLabel)
        toolbar.addSubview(subTitleLabel)
        toolbar.addSubview(priceLabel)
        toolbar.addSubview(changedLabel)
        toolbar.addSubview(buyButton)
        toolbar.addSubview(stack)
        
        
        [dayButton,
         weakButton,
         monthButton,
        halfYearButton,
        yearButton,
         allButton].forEach {
            stack.addArrangedSubview($0)
        }
        
    
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolbar.topAnchor.constraint(equalTo: view.topAnchor),
            toolbar.heightAnchor.constraint(equalToConstant: 120),
            
            favouriteButton.trailingAnchor.constraint(equalTo: toolbar.trailingAnchor, constant: -18),
            favouriteButton.bottomAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: -28),
            favouriteButton.heightAnchor.constraint(equalToConstant: 22),
            favouriteButton.widthAnchor.constraint(equalToConstant: 22),
            
            

            leaveButton.leadingAnchor.constraint(equalTo: toolbar.leadingAnchor, constant: 18),
            leaveButton.bottomAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: -28),
            leaveButton.widthAnchor.constraint(equalToConstant: 20),
            leaveButton.heightAnchor.constraint(equalToConstant: 14),
            
            titleLabel.centerYAnchor.constraint(equalTo: toolbar.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: toolbar.centerXAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitleLabel.centerXAnchor.constraint(equalTo: toolbar.centerXAnchor),
            
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLabel.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 63),
            
            changedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changedLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -52)
        ])
    }
    
    
}

extension UIView {
    func dropShadow(scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.5
      layer.shadowOffset = CGSize(width: -10, height: 10)
      layer.shadowRadius = 10

      layer.shadowPath = UIBezierPath(rect: bounds).cgPath
      layer.shouldRasterize = true
      layer.rasterizationScale = scale ? UIScreen.main.scale : 10
    }
}
