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
        label.text = "Добавление цели"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .left
        label.frame.size.height = 30
        return label
    }()
    
    let nameInput: UITextField = {
        let tf = UITextField()
        tf.placeholder = "На что вы копите?"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 30
        return tf
    }()
    
    let priceInput: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Сколько нужно накопить?"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 30
        return tf
    }()
    
    let savingsInput: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Сколько уже накоплено?"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 30
        return tf
    }()
    
    let incomeInput: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Сколько вы получаете в неделю?"
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textAlignment = .left
        tf.frame.size.height = 30
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
//        goalImage.snp.makeConstraints { make in
//            make.top.equalTo(self).offset(20)
//            make.left.equalTo(self).offset(40)
//            make.right.equalTo(self).offset(-40)
//            make.height.equalTo(self).multipliedBy(0.4)
//        }

    }
    
//MARK: - APPEARANCE
    
    func setAppearance() {
//        if traitCollection.userInterfaceStyle == .dark {
//            self.backgroundColor = .black
//        } else { self.backgroundColor = .white }
    }
}
