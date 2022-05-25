//
//  StockCell.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 24.05.2022.
//

import UIKit

final class StockCell: UITableViewCell {
    static let typeName = "STOCKCELLID"
    
    //MARK: Views
    lazy var iconView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var changedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        //#24B25D
        label.textColor = UIColor(red: 0.14, green: 0.70, blue: 0.36, alpha: 1.00)
        return label
    }()
    lazy var starButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "Path"), for: UIControl.State.normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var customView: UIView = {
        let view = UIView()
        return view
    }()
    
    //MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: methods
    func setupView() {
        contentView.addSubview(iconView)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(changedLabel)
        contentView.addSubview(starButton)
        contentView.layer.cornerRadius = 16

        setupConstraints()
    }

    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            iconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            iconView.widthAnchor.constraint(equalToConstant: 52),
            iconView.heightAnchor.constraint(equalToConstant: 52),
            
            symbolLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            symbolLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            
            nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor),
            
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            
            changedLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor),
            changedLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
    
            starButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            starButton.leadingAnchor.constraint(equalTo: symbolLabel.trailingAnchor, constant: 6),
            starButton.widthAnchor.constraint(equalToConstant: 16),
            starButton.heightAnchor.constraint(equalToConstant: 16),
            
            contentView.heightAnchor.constraint(equalToConstant: 68)
        ])
    }
}
