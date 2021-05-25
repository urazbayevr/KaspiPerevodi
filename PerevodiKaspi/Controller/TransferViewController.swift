//
//  TransferViewController.swift
//  PerevodiKaspi
//
//  Created by Рамазан  on 24.05.2021.
//

import UIKit
import SnapKit

class TransferViewController: UIViewController {
    
    fileprivate lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.frame = self.view.frame
        tableView.alwaysBounceVertical = true
        tableView.backgroundColor = .clear
        
        tableView.sectionHeaderHeight = 70
        
        //registrations
        tableView.register(HorizontalCellView.self, forCellReuseIdentifier: App.CellIdentifier.hstackCellId)
        tableView.register(HistoryCellView.self, forCellReuseIdentifier: App.CellIdentifier.vstackCellId)
        return tableView
    }()
    
    private lazy var segmentedController: UISegmentedControl = {
        let titles = ["Мои Переводы", "История"]
        let segmentControl = UISegmentedControl(items: titles)
        segmentControl.tintColor = .white
        segmentControl.tintColorDidChange()
        segmentControl.backgroundColor = .white
        segmentControl.selectedSegmentTintColor = .red
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.sendActions(for: .valueChanged)
        return segmentControl
    }()
    
    private lazy var containerSegment: UIView = {
        let containerSegment = UIView()
        containerSegment.backgroundColor = .white
        return containerSegment
    }()
    
    lazy var kzButton : UIButton = {
        let button = UIButton()
        button.setTitle("Қаз", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.red, for: .selected)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.cornerRadius = 11
        button.layer.borderWidth = 2
        button.isSelected = true
        button.addTarget(self, action: #selector(kzTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var rusButton : UIButton = {
        let button = UIButton()
        button.setTitle("Рус", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.red, for: .selected)
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.cornerRadius = 11
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(ruTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var filterLabel : UIView = {
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        let label = UILabel()
        let image = UIImageView()
        label.font = .systemFont(ofSize: 15)
        label.text = "Настроить фильтр"
        label.textColor = .lightGray
        image.image = UIImage(named: "FilterIcon")
        image.tintColor = .red
        tableHeaderView.addSubview(label)
        tableHeaderView.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-15)
            make.width.height.equalTo(20)
        }
        label.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(15)
        }
        tableHeaderView.backgroundColor = .white
        
        return tableHeaderView
    }()
    
    private var swapTable : Bool = true
    let historyList : [History] = [ History(name: "Салтанат С.", index: 0, amount: 180.00),
                                    History(name: "Салтанат С.", index: 1, amount: 1110.00),
                                    History(name: "Максат Г.", index: 1, amount: 1500.00),
                                    History(name: "Нурсултан С.", index: 1, amount: 1110.00),
                                    History(name: "Оркен С.", index: 2, amount: 10000.00),
                                    History(name: "Ернар Ж.", index: 2, amount: 535.00),
                                    History(name: "Рамазан У.", index: 2, amount: 2110.00),
                                    History(name: "Рауан А.", index: 2, amount: 3000.00),
    ]
    let sectionDates : [String] = ["23 Мая", "24 Июня", "25 Июня", "26 Июня"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        configUI()
        
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(paramTapped))
        leftButton.tintColor = .red
        
        let searchButton = UIBarButtonItem(customView: kzButton)
        let editButton = UIBarButtonItem(customView: rusButton)
        
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItems = [editButton, searchButton]
    }
}

//MARK: - Action
extension TransferViewController {
    @objc func segmentChanged(_ sender: UISegmentedControl){
        swapTable = sender.selectedSegmentIndex == 0 ? true : false
        tableView.tableHeaderView = swapTable ? UIView() : filterLabel
        tableView.reloadData()
    }
    
    @objc func kzTapped(_ sender: UIButton) {
        sender.isSelected = true
        rusButton.isSelected = false
        sender.layer.borderColor = UIColor.red.cgColor
        rusButton.layer.borderColor = UIColor.clear.cgColor
    }
    
    @objc func ruTapped(_ sender: UIButton) {
        sender.isSelected = true
        kzButton.isSelected = false
        sender.layer.borderColor = UIColor.red.cgColor
        kzButton.layer.borderColor = UIColor.clear.cgColor
    }
    
    @objc func paramTapped() {
        
    }
}

//MARK: - delegate for tableview
extension TransferViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return swapTable ? 1 : sectionDates.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return swapTable ? 4 : historyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if swapTable == true {
            switch indexPath.row {
            case 0:
                let firstCell = tableView.dequeueReusableCell(withIdentifier: App.CellIdentifier.hstackCellId, for: indexPath) as! HorizontalCellView
                
                let imageView = UIImage(systemName: "repeat")
                firstCell.set(image: imageView, name: "Между своими счетами", message: nil)
                return firstCell
            case 1:
                let firstCell = tableView.dequeueReusableCell(withIdentifier: App.CellIdentifier.hstackCellId, for: indexPath) as! HorizontalCellView
                
                let imageView = UIImage(systemName: "person")
                firstCell.set(image: imageView, name: "Клиенту Kaspi", message: "На карту Kaspi Gold")
                return firstCell
            case 2:
                let firstCell = tableView.dequeueReusableCell(withIdentifier: App.CellIdentifier.hstackCellId, for: indexPath) as! HorizontalCellView
                
                let imageView = #imageLiteral(resourceName: "CardIcon")
                firstCell.set(image: imageView, name: "Карта другого банка", message: "С карты на карту")
                return firstCell
            case 3:
                let firstCell = tableView.dequeueReusableCell(withIdentifier: App.CellIdentifier.hstackCellId, for: indexPath) as! HorizontalCellView
                
                let imageView = UIImage(systemName: "globe")
                firstCell.set(image: imageView, name: "Международные переводы", message: "На карту любого банка мира")
                return firstCell
            default:
                return UITableViewCell()
            } }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: App.CellIdentifier.vstackCellId, for: indexPath) as! HistoryCellView
            let history = historyList[indexPath.row]
            cell.set(name: history.name, amount: history.amount)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if swapTable == true && indexPath.row == 0{
            self.navigationController?.pushViewController(BetweenYourAccounts(), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 25))
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        let label = UILabel()
        label.text = sectionDates[section]
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return swapTable ? 0 : 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
}

//MARK: - UI
extension TransferViewController {
    private func configUI() {
        self.title = "Каспи Gold"
        self.setTitle("Переводы", andImage: #imageLiteral(resourceName: "KaspiImage"))
        
        view.addSubview(containerSegment)
        containerSegment.addSubview(segmentedController)
        view.addSubview(tableView)
        
        containerSegment.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        segmentedController.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedController.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
        }
    }
}

//MARK: - navigation title
extension UIViewController {
    func setTitle(_ title: String, andImage image: UIImage) {
        let titleLbl = UILabel()
        titleLbl.text = title
        titleLbl.textAlignment = .left
        titleLbl.textColor = UIColor.black
        titleLbl.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        let image = UIImageView(image: image)
        let titleView = UIStackView(arrangedSubviews: [image, titleLbl])
        titleView.axis = .horizontal
        titleView.spacing = 10.0
        navigationItem.titleView = titleView
        
        image.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        titleView.snp.makeConstraints { (make) in
            make.width.equalTo(150)
        }
    }
}
