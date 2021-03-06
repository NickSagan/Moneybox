//
//  CongratsView.swift
//  Moneybox
//
//  Created by Nick Sagan on 24.02.2022.
//

import UIKit
import SnapKit

class CongratsView: UIView {

    let title: UILabel = {
        let label = UILabel()
        label.text = "Поздравляем!"
        label.font = UIFont.systemFont(ofSize: 36)
        label.textColor = .white
        label.textAlignment = .center
        label.frame.size.height = 40
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel()
        label.text = "Вы достигли вашей цели! Вы накопили 500000 рублей"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 10
        label.lineBreakMode = .byClipping
        return label
    }()
    
    let newGoalButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Задать новую цель", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor.black.withAlphaComponent(0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black.withAlphaComponent(0)
        addSubviews()
        setupConstraints()
        setAppearance()
    }
    
//MARK: - ADD SUBVIEWS
    
    func addSubviews() {
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(newGoalButton)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        newGoalButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
//MARK: - SETUP CONSTRAINTS
    
    func setupConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalTo(self).offset(0)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(40)
        }
        
        subTitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(100)
        }
        
        newGoalButton.snp.makeConstraints { make in
            make.top.equalTo(subTitle.snp.bottom).offset(10)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(20)
        }
    }
    
//MARK: - APPEARANCE
    
    func setAppearance() {
//        if traitCollection.userInterfaceStyle == .dark {
//            self.backgroundColor = .black
//        } else { self.backgroundColor = .white }
    }
}
