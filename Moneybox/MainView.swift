//
//  MainView.swift
//  Moneybox
//
//  Created by Nick Sagan on 18.02.2022.
//

import UIKit
import SnapKit

class MainView: UIView {
    
    let goalImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "piggy")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let goalName: UILabel = {
        let label = UILabel()
        label.text = "Цель: конструктор Lego"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .left
        label.frame.size.height = 40
        return label
    }()
    
    let weeksLeft: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Осталось копить\nещё 10 недель \nдо 8 августа 2022"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.frame.size.height = 100
        return label
    }()
    
    let progressBar: GradientHorizontalProgressBar = {
        let pv = GradientHorizontalProgressBar()
        pv.progress = 0.6
        pv.color = UIColor.systemGreen
        pv.gradientColor = UIColor.white
        pv.backgroundColor = UIColor.systemGray4
        return pv
    }()

    let moneyLeft: UILabel = {
        let label = UILabel()
        label.text = "Накопи еще 832 рублей"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.frame.size.height = 30
        return label
    }()
    
    let progresslabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Накоплено 532 из 950 рублей"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.frame.size.height = 30
        return label
    }()
    
    let plusButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setBackgroundImage(UIImage(systemName: "plus.circle"), for: .normal)
        btn.frame.size.height = 50
        btn.frame.size.width = 50
        return btn
    }()
    
    let minusButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setBackgroundImage(UIImage(systemName: "minus.circle"), for: .normal)
        btn.frame.size.height = 50
        btn.frame.size.width = 50
        return btn
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
        self.addSubview(goalName)
        self.addSubview(goalImage)
        self.addSubview(weeksLeft)
        self.addSubview(progressBar)
        self.addSubview(moneyLeft)
        progressBar.addSubview(progresslabel)
        self.addSubview(plusButton)
        self.addSubview(minusButton)
        
        goalName.translatesAutoresizingMaskIntoConstraints = false
        goalImage.translatesAutoresizingMaskIntoConstraints = false
        weeksLeft.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        moneyLeft.translatesAutoresizingMaskIntoConstraints = false
        progresslabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
//MARK: - SETUP CONSTRAINTS
    
    func setupConstraints() {
        goalImage.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self).offset(40)
            make.right.equalTo(self).offset(-40)
            make.height.equalTo(self).multipliedBy(0.4)
        }
        
        goalName.snp.makeConstraints { make in
            make.top.equalTo(goalImage.snp.bottom).offset(20)
            make.left.equalTo(goalImage.snp.left)
            make.right.equalTo(goalImage.snp.right)
        }
        
        weeksLeft.snp.makeConstraints { make in
            make.top.equalTo(goalName.snp.bottom).offset(20)
            make.centerX.equalTo(goalImage.snp.centerX)
        }
        
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(weeksLeft.snp.bottom).offset(20)
            make.height.equalTo(self).multipliedBy(0.1)
        }
        
        plusButton.snp.makeConstraints { make in
            make.centerY.equalTo(progressBar.snp.centerY)
            make.right.equalTo(self).offset(-10)
            make.left.equalTo(progressBar.snp.right).offset(10)
            make.height.equalTo(progressBar.snp.height).multipliedBy(0.5)
            make.width.equalTo(plusButton.snp.height)
        }
        
        minusButton.snp.makeConstraints { make in
            make.centerY.equalTo(progressBar.snp.centerY)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(progressBar.snp.left).offset(-10)
            make.height.equalTo(progressBar.snp.height).multipliedBy(0.5)
            make.width.equalTo(plusButton.snp.height)
        }
        
        moneyLeft.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(20)
            make.centerX.equalTo(goalImage.snp.centerX)
        }
        
        progresslabel.snp.makeConstraints { make in
            make.centerX.equalTo(progressBar.snp.centerX)
            make.centerY.equalTo(progressBar.snp.centerY)
        }
    }
    
//MARK: - APPEARANCE
    
    func setAppearance() {
//        if traitCollection.userInterfaceStyle == .dark {
//            self.backgroundColor = .black
//        } else { self.backgroundColor = .white }
    }
}
