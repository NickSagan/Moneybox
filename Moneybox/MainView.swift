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
        img.image = UIImage(named: "addGoalImage")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let goalName: UILabel = {
        let label = UILabel()
        label.text = "Цель:"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .left
        label.frame.size.height = 40
        return label
    }()
    
    let weeksLeft: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Осталось копить:\n10 недель \nдо 8 августа 2022"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.frame.size.height = 100
        return label
    }()
    
    let progressBar: BarProgressView = {
       let pr = BarProgressView()
        pr.progress = 0.5
        pr.progressColor = .systemGreen
        pr.showTriangle = true
        return pr
    }()

    let moneyLeft: UILabel = {
        let label = UILabel()
        label.text = "Накопи еще 832 рублей"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.frame.size.height = 30
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
        self.addSubview(goalName)
        self.addSubview(goalImage)
        self.addSubview(weeksLeft)
        self.addSubview(progressBar)
        self.addSubview(moneyLeft)
        
        goalName.translatesAutoresizingMaskIntoConstraints = false
        goalImage.translatesAutoresizingMaskIntoConstraints = false
        weeksLeft.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        moneyLeft.translatesAutoresizingMaskIntoConstraints = false
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
            make.left.equalTo(goalImage.snp.left)
            make.right.equalTo(goalImage.snp.right)
        }
        
        moneyLeft.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom).offset(20)
            make.centerX.equalTo(goalImage.snp.centerX)
        }
    }
    
//MARK: - APPEARANCE
    
    func setAppearance() {
        if traitCollection.userInterfaceStyle == .dark {
            self.backgroundColor = .black
        } else { self.backgroundColor = .white }
    }
}
