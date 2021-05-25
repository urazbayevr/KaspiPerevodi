//
//  HorizontalCellView.swift
//  PerevodiKaspi
//
//  Created by Рамазан  on 24.05.2021.
//


import UIKit
import SnapKit

class HorizontalCellView: UITableViewCell {
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .white
        return containerView
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.tintColor = .red
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 16)
        return nameLabel
    }()
    
    lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.font = .systemFont(ofSize: 12)
        messageLabel.textColor = .gray
        messageLabel.numberOfLines = 2
        return messageLabel
    }()
    
    lazy var selectionImage: UIImageView = {
        let selectionImage = UIImageView()
        selectionImage.image = UIImage(systemName: "chevron.right")
        selectionImage.tintColor = .gray
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
    
    
    func set(image: UIImage?, name: String, message: String?) {
        if let mes = message {
            messageLabel.text = mes
        }else {
            nameLabel.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
            }
            messageLabel.isHidden = true
        }
        
        iconImageView.image = image
        nameLabel.text = name
    }
    
    func configUI() {
        self.backgroundColor = .lightGray
        
        self.addSubview(containerView)
        
        [iconImageView, nameLabel, messageLabel, selectionImage].forEach {
            containerView.addSubview($0)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.top.equalTo(1)
            make.left.right.bottom.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(25)
            make.width.equalTo(30)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(16)
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.right.equalTo(selectionImage.snp.left).offset(-5)
        }
        
        messageLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
        selectionImage.snp.makeConstraints { (make) in
            make.right.equalTo(-16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(10)
        }
    }
}


