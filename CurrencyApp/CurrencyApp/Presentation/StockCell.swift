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
    private var iconView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "yandex")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        return image
    }()
    private var symbolLabel: UILabel = {
        let label = UILabel()
        label.text = "YNDX"
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
            
        ])
    }
}
