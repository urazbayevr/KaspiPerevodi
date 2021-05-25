//
//  HistoryCellView.swift
//  PerevodiKaspi
//
//  Created by Рамазан  on 25.05.2021.
//

import UIKit
import SnapKit

class HistoryCellView: UITableViewCell {
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        return containerView
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.tintColor = .gray
        imageView.image = UIImage(systemName: "person.circle")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    lazy var cardLabel: UILabel = {
        let cardLabel = UILabel()
        cardLabel.text = "Kaspi Gold"
        cardLabel.numberOfLines = 0
        cardLabel.textColor = .black
        cardLabel.font = .systemFont(ofSize: 15)
        return cardLabel
    }()
    
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 15)
        return nameLabel
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Клинету Kaspi"
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let amountLabel = UILabel()
        amountLabel.font = .systemFont(ofSize: 15)
        amountLabel.textColor = .black
        amountLabel.numberOfLines = 0
        return amountLabel
    }()
    
    lazy var selectionImage: UIImageView = {
        let selectionImage = UIImageView()
        selectionImage.image = UIImage(systemName: "arrow.right")
        selectionImage.tintColor = .red
        selectionImage.contentMode = .scaleAspectFill
        return selectionImage
    }()
    
    //MARK: - INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(name: String, amount: Double) {
        
        amountLabel.text = "\(amount) ₸"
        nameLabel.text = name
    }
    
    func configUI() {
        self.backgroundColor = .lightGray
        self.addSubview(containerView)
        
        [iconImageView, nameLabel, amountLabel, selectionImage, cardLabel, infoLabel].forEach {
            containerView.addSubview($0)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(1)
            make.left.right.bottom.equalToSuperview()
        }
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.top.equalTo(10)
            make.height.width.equalTo(35)
        }
        
        cardLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.top.equalTo(10)
        }
        
        selectionImage.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(9)
            make.top.equalTo(cardLabel.snp.bottom).offset(5)
            make.width.equalTo(15)
            make.height.equalTo(10)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(selectionImage.snp.right).offset(6)
            make.top.equalTo(cardLabel.snp.bottom).offset(2)
        }
        
        infoLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(9)
            make.top.equalTo(selectionImage.snp.bottom).offset(10)
        }
        
        amountLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.top.equalTo(10)
        }
    }
}
