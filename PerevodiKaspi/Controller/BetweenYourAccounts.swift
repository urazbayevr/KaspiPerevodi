//
//  BetweenYourAccounts.swift
//  PerevodiKaspi
//
//  Created by Рамазан  on 24.05.2021.
//

import UIKit
import SnapKit

class BetweenYourAccounts: UIViewController {
    
    private lazy var sendLabel: UIButton = {
        let sendLabel = UIButton()
        let paramImage = UIImageView()
        let textLabel = UILabel()
        
        sendLabel.backgroundColor = .white
        textLabel.text = "Откуда"
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.textColor = .lightGray
        paramImage.image = UIImage(named: "DotsIcon")
        paramImage.tintColor = .red
        sendLabel.addSubview(paramImage)
        sendLabel.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
        }
        paramImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-15)
            make.width.height.equalTo(20)
        }
        return sendLabel
    }()
    
    private lazy var toLabel: UIButton = {
        let sendLabel = UIButton()
        let paramImage = UIImageView()
        let textLabel = UILabel()
        
        sendLabel.backgroundColor = .white
        textLabel.text = "Куда"
        textLabel.font = .systemFont(ofSize: 15)
        textLabel.textColor = .lightGray
        paramImage.image = UIImage(named: "DotsIcon")
        paramImage.tintColor = .red
        sendLabel.addSubview(paramImage)
        sendLabel.addSubview(textLabel)
        textLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
        }
        paramImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-15)
            make.width.height.equalTo(20)
        }
        return sendLabel
    }()
    
    private lazy var amountField: UITextField = {
        let amountField = UITextField()
        amountField.placeholder = "0 ₸"
        amountField.backgroundColor = .white
        amountField.contentVerticalAlignment = .center;
        amountField.textAlignment = .center;
        return amountField
    }()
    
    private lazy var roundImage: UIView = {
        let view = UIView()
        let image = UIImageView()
        
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        image.image = UIImage(systemName: "chevron.compact.down")
        image.contentMode = .scaleAspectFill
        image.tintColor = .red
        view.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(15)
            make.width.equalTo(10)
        }
        return view
    }()
    
    private lazy var chargeLabel: UILabel = {
        let label = UILabel()
        label.text = "Комиссия 0 ₸"
        label.textColor = .lightGray
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var clickButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Перевести 0 ₸", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        navigationItem.title = "Между своими счетами"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        configUI()
    }
}

extension BetweenYourAccounts {
    func configUI(){
        self.view.addSubview(sendLabel)
        self.view.addSubview(toLabel)
        self.view.addSubview(roundImage)
        self.view.addSubview(amountField)
        self.view.addSubview(chargeLabel)
        self.view.addSubview(clickButton)
        sendLabel.snp.makeConstraints { (make) in
            make.top.equalTo(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
        toLabel.snp.makeConstraints { (make) in
            make.top.equalTo(sendLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
        roundImage.snp.makeConstraints { (make) in
            make.top.equalTo(sendLabel.snp.bottom).offset(-3)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(20)
        }
        amountField.snp.makeConstraints { (make) in
            make.top.equalTo(toLabel.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
        }
        chargeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(amountField.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        clickButton.snp.makeConstraints { (make) in
            make.top.equalTo(chargeLabel.snp.bottom).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(70)
        }
    }
}
