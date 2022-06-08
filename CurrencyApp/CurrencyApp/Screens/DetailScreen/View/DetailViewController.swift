//
//  DetailViewController.swift
//  CurrencyApp
//
//  Created by Zhandos Baimurat on 27.05.2022.
//

import Foundation
import UIKit
import Charts

class DetailViewController: UIViewController {
    private let presenter: DetailPresenterProtocol
    private lazy var titleView: UIView = {
        let view = DetailTitleView()
        view.configure(with: TilteModel.from(stockModel: presenter.model()))
        return view
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = " "
        return label
    }()
    
    private lazy var changedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        //#24B25D
        label.textColor = UIColor(red: 0.14, green: 0.70, blue: 0.36, alpha: 1.00)
        label.text = " "
        return label
    }()
    
    private lazy var buyButton: UIButton = {
        let button = UIButton(configuration: selectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.setTitle(" ", for: .normal)
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
        return filled
    }()
    
    
    private lazy var dayButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("D", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var weakButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("W", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var monthButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("M", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    private lazy var halfYearButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("6M", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var yearButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Y", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var allButton: UIButton = {
        let button = UIButton(configuration: unSelectedConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ALL", for: .normal)
        button.setTitleColor(.black, for: .normal)
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
    private lazy var lineCharts: LineChartView = {
        let chartView = LineChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        chartView.xAxis.labelTextColor = .white
        chartView.leftAxis.labelTextColor = .white
        chartView.rightAxis.labelTextColor = .white
        
        
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.rightAxis.drawAxisLineEnabled = false

        
        chartView.animate(xAxisDuration: 1.0)
        return chartView
    }()
    

    
    
    //MARK: init
    init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
        presenter.loadView(id: presenter.stockItem.id, currency: "usd", days: "30")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setup()
    }
    
    func setup() {
        
        view.addSubview(priceLabel)
        view.addSubview(changedLabel)
        view.addSubview(lineCharts)
        view.addSubview(buyButton)
        
        [dayButton,
         weakButton,
         monthButton,
        halfYearButton,
        yearButton,
         allButton].forEach {
            $0.addTarget(self, action: #selector(action), for: .touchUpInside)
            stack.addArrangedSubview($0)
        }
        
        view.addSubview(stack)
        setupNavigation()
        setupConstraints()
    }
    func setData(value: [Double]) {
        var entries: [ChartDataEntry] = []
        for i in 0..<value.count {
            entries.append(ChartDataEntry(x: Double(i), y: value[i]))
        }
        let set = LineChartDataSet(entries: entries, label: "")
        set.drawCirclesEnabled = false
        set.mode = .cubicBezier
        set.lineWidth = 4
        set.setColor(.black)
        set.fill = ColorFill(color: .gray)
        set.fillAlpha = 0.8
        set.drawFilledEnabled = true
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(false)
        
        lineCharts.data = data
        data.notifyDataChanged()
        lineCharts.notifyDataSetChanged()
        lineCharts.animate(xAxisDuration: 1.0)
    }
    
    
    func setupNavigation() {
        setupFavouriteButton()
        setupTitle()
    }
    
    func setupFavouriteButton() {
        let favouriteButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "star"), for: .normal)
            button.setImage(UIImage(systemName: "star.fill"), for: .selected)
            button.addTarget(self, action: #selector(favourite), for: .touchUpInside)
            button.tintColor = .black
            button.translatesAutoresizingMaskIntoConstraints = false
            button.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
            return button
        }()
        favouriteButton.isSelected = presenter.model().isFavourite
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: favouriteButton)
        
    }
    func turnOffAllButton() {
//        [dayButton,
//         weakButton,
//         monthButton,
//        halfYearButton,
//        yearButton,
//         allButton].forEach {
//            $0.configuration = unSelectedConfig
//            $0.setTitleColor(.black, for: .normal)
//        }
    }
    
    
    
    @objc func action(sender: UIButton) {
        var days: String = ""
        turnOffAllButton()
        switch sender.titleLabel?.text {
            case "D": days = "1"
            case "W": days = "7"
            case "M": days = "30"
            case "6M": days = "180"
            case "Y": days="365"
            default: days = "500"
        }
        presenter.loadView(id: presenter.stockItem.id, currency: "usd", days: days)
    }
    
    @objc func favourite(sender: UIButton) {
        sender.isSelected.toggle()
        presenter.model().setFavourite()
    }
    func setupTitle() {
        navigationItem.titleView = titleView
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 63),


            changedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changedLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
        
            buyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: -52),

            lineCharts.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineCharts.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineCharts.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -40),
            lineCharts.topAnchor.constraint(equalTo: changedLabel.bottomAnchor, constant: 30)
        ])
    }
}

extension DetailViewController: DetailViewProtocol {
    func updateView() {
        guard let detail = presenter.getDetail() else {
            return
        }
        priceLabel.text = detail.getValue()
        changedLabel.text = detail.getValueChange()
        setData(value: detail.getPrices())
    }
    
    func updateView(withLoader isLoading: Bool) {
        
    }
    
    func updateView(withError message: String) {
    }
}
