//
//  CongratsVC.swift
//  Moneybox
//
//  Created by Nick Sagan on 24.02.2022.
//

import UIKit
import SnapKit

class CongratsVC: UIViewController {
    
    var congratsView: CongratsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "congrats")!)
        congratsView = CongratsView()
        congratsView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(congratsView)
        
        congratsView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        let goal = GoalManager.shared.getGoal()
        congratsView.subTitle.text = "Вы достигли вашей цели: \(goal.name)! Вы накопили \(goal.price) рублей"
        
        congratsView.newGoalButton.addTarget(self, action: #selector(setNewGoal), for: .touchUpInside)
    }
    
    @objc func setNewGoal() {
        let vc = AddGoalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
