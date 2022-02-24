//
//  AddGoalView.swift
//  Moneybox
//
//  Created by Nick Sagan on 22.02.2022.
//

import UIKit
import SnapKit

class AddGoalView: UIView {

    let header: UILabel = {
        let label = UILabel()
        label.text = "Добавление цели:"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .left
        label.frame.size.height = 30
        return label
    }()
    
    let nameInput: KaedeTextField = {
        let tf = KaedeTextField()
        tf.placeholder = "Название"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 40
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.layer.cornerRadius = 8
        tf.returnKeyType = .done
        return tf
    }()
    
    let priceInput: KaedeTextField = {
        let tf = KaedeTextField()
        tf.placeholder = "Стоимость"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 40
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.layer.cornerRadius = 8
        tf.keyboardType = .numberPad
        tf.returnKeyType = .done
        return tf
    }()
    
    let savingsInput: KaedeTextField = {
        let tf = KaedeTextField()
        tf.placeholder = "Уже накоплено"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 40
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.layer.cornerRadius = 8
        tf.keyboardType = .numberPad
        tf.returnKeyType = .done
        return tf
    }()
    
    let incomeInput: KaedeTextField = {
        let tf = KaedeTextField()
        tf.placeholder = "Доход в неделю"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 40
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.layer.cornerRadius = 8
        tf.keyboardType = .numberPad
        tf.returnKeyType = .done
        return tf
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor.systemRed
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .left
        label.frame.size.height = 80
        label.numberOfLines = 0
        label.lineBreakMode = .byClipping
        return label
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.white.withAlphaComponent(0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white.withAlphaComponent(0)
        addSubviews()
        setupConstraints()
        setAppearance()
    }
    
//MARK: - ADD SUBVIEWS
    
    func addSubviews() {
        self.addSubview(header)
        self.addSubview(nameInput)
        self.addSubview(priceInput)
        self.addSubview(savingsInput)
        self.addSubview(incomeInput)
        self.addSubview(errorLabel)
        
        header.translatesAutoresizingMaskIntoConstraints = false
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        priceInput.translatesAutoresizingMaskIntoConstraints = false
        savingsInput.translatesAutoresizingMaskIntoConstraints = false
        incomeInput.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
//MARK: - SETUP CONSTRAINTS
    
    func setupConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(30)
        }
        
        nameInput.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(40)
        }
        
        priceInput.snp.makeConstraints { make in
            make.top.equalTo(nameInput.snp.bottom).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(40)
        }
        
        savingsInput.snp.makeConstraints { make in
            make.top.equalTo(priceInput.snp.bottom).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(40)
        }
        
        incomeInput.snp.makeConstraints { make in
            make.top.equalTo(savingsInput.snp.bottom).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(40)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(incomeInput.snp.bottom).offset(15)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(80)
        }

    }
    
//MARK: - APPEARANCE
    
    func setAppearance() {
//        if traitCollection.userInterfaceStyle == .dark {
//            self.backgroundColor = .black
//        } else { self.backgroundColor = .white }
    }
}
