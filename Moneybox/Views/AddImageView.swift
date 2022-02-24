//
//  AddImageView.swift
//  Moneybox
//
//  Created by Nick Sagan on 22.02.2022.
//

import UIKit
import SnapKit

class AddImageView: UIView {

    let header: UILabel = {
        let label = UILabel()
        label.text = "Добавление фото:"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .left
        label.frame.size.height = 30
        return label
    }()

    let imageView: UIImageView = {
       let imgView = UIImageView()
        imgView.backgroundColor = UIColor.black.withAlphaComponent(0)
        imgView.frame.size = CGSize(width: 300, height: 300)
        imgView.image = UIImage(named: "piggy")
        return imgView
    }()
    
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Добавить фото", for: .normal)
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
        self.addSubview(header)
        self.addSubview(imageView)
        self.addSubview(button)

        header.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
    }
    
//MARK: - SETUP CONSTRAINTS
    
    func setupConstraints() {
        header.snp.makeConstraints { make in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(30)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(300)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
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
