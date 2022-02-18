//
//  MainVC.swift
//  Moneybox
//
//  Created by Nick Sagan on 18.02.2022.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    
    var mainView: MainView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        mainView = MainView()
        mainView.backgroundColor = UIColor.white.withAlphaComponent(0)
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(UIEdgeInsets(top: 50, left: 10, bottom: 10, right: 10))
        }
    }

}

