//
//  QuizView.swift
//  Моя копилка сбережений
//
//  Created by Nick Sagan on 10.03.2022.
//

import UIKit

class QuizView: UIView {
    
    let question: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.layer.cornerRadius = 10.0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.frame.size.height = 200
        label.numberOfLines = 10
        label.lineBreakMode = .byClipping
        return label
    }()
    
    let answer1: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        btn.tag = 1
        return btn
    }()
    
    let answer2: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        btn.tag = 2
        return btn
    }()
    
    let answer3: UIButton = {
        let btn = UIButton()
        btn.setTitle("", for: .normal)
        btn.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        btn.tag = 3
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
        self.addSubview(question)
        self.addSubview(answer1)
        self.addSubview(answer2)
        self.addSubview(answer3)

        question.translatesAutoresizingMaskIntoConstraints = false
        answer1.translatesAutoresizingMaskIntoConstraints = false
        answer2.translatesAutoresizingMaskIntoConstraints = false
        answer3.translatesAutoresizingMaskIntoConstraints = false
    }
    
//MARK: - SETUP CONSTRAINTS
    
    func setupConstraints() {
        question.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self).offset(40)
            make.right.equalTo(self).offset(-40)
            make.height.equalTo(self).multipliedBy(0.4)
        }
        
        answer1.snp.makeConstraints { make in
            make.top.equalTo(question.snp.bottom).offset(20)
            make.left.equalTo(question.snp.left)
            make.right.equalTo(question.snp.right)
        }
        
        answer2.snp.makeConstraints { make in
            make.top.equalTo(answer1.snp.bottom).offset(20)
            make.left.equalTo(question.snp.left)
            make.right.equalTo(question.snp.right)
        }
        
        answer3.snp.makeConstraints { make in
            make.top.equalTo(answer2.snp.bottom).offset(20)
            make.left.equalTo(question.snp.left)
            make.right.equalTo(question.snp.right)
        }
    }
    
//MARK: - APPEARANCE
    
    func setAppearance() {
//        if traitCollection.userInterfaceStyle == .dark {
//            self.backgroundColor = .black
//        } else { self.backgroundColor = .white }
    }
}
