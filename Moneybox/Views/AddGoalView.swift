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
    
    let nameInput: TextField = {
        let tf = TextField()
        tf.placeholder = " На что вы копите?"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 30
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.layer.cornerRadius = 8
        tf.layer.backgroundColor = UIColor.systemGray4.cgColor
        tf.returnKeyType = .done
        
        return tf
    }()
    
    let priceInput: TextField = {
        let tf = TextField()
        tf.placeholder = " Сколько нужно накопить?"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 30
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.layer.cornerRadius = 8
        tf.layer.backgroundColor = UIColor.systemGray4.cgColor
        tf.keyboardType = .decimalPad
        tf.returnKeyType = .done
        return tf
    }()
    
    let savingsInput: TextField = {
        let tf = TextField()
        tf.placeholder = " Сколько уже накоплено?"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 30
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.layer.cornerRadius = 8
        tf.layer.backgroundColor = UIColor.systemGray4.cgColor
        tf.keyboardType = .decimalPad
        tf.returnKeyType = .done
        return tf
    }()
    
    let incomeInput: TextField = {
        let tf = TextField()
        tf.placeholder = " Сколько вы получаете в неделю?"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 30
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.layer.cornerRadius = 8
        tf.layer.backgroundColor = UIColor.systemGray4.cgColor
        tf.keyboardType = .decimalPad
        tf.returnKeyType = .done
        return tf
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
        
        header.translatesAutoresizingMaskIntoConstraints = false
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        priceInput.translatesAutoresizingMaskIntoConstraints = false
        savingsInput.translatesAutoresizingMaskIntoConstraints = false
        incomeInput.translatesAutoresizingMaskIntoConstraints = false
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
            make.height.equalTo(30)
        }
        
        priceInput.snp.makeConstraints { make in
            make.top.equalTo(nameInput.snp.bottom).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(30)
        }
        
        savingsInput.snp.makeConstraints { make in
            make.top.equalTo(priceInput.snp.bottom).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(30)
        }
        
        incomeInput.snp.makeConstraints { make in
            make.top.equalTo(savingsInput.snp.bottom).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(30)
        }

    }
    
//MARK: - APPEARANCE
    
    func setAppearance() {
//        if traitCollection.userInterfaceStyle == .dark {
//            self.backgroundColor = .black
//        } else { self.backgroundColor = .white }
    }
}
