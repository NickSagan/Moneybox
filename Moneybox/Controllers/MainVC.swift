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
    var goal: GoalModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        mainView = MainView()
        mainView.backgroundColor = UIColor.white.withAlphaComponent(0)
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGoal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareGoal))
        
        goal = GoalModel(name: "Lego NinjaGo", photo: UIImage(named: "piggy")!, price: 9000, savings: 3400, income: 1000)
        
        refreshGoal()
    }
    
    func refreshGoal() {
        if let goal = self.goal {
            mainView.goalName.text = "Цель: \(goal.name)"
            mainView.weeksLeft.text = "Осталось копить\nещё \((goal.price - goal.savings) / goal.income + 1) недель"
            mainView.progresslabel.text = "Накоплено \(goal.savings) из \(goal.price) рублей"
            mainView.moneyLeft.text = "Накопи ещё \(goal.price - goal.savings) рублей"
            mainView.goalImage.image = goal.photo
        } else {
            mainView.goalName.text = "Цель: не указана"
            mainView.weeksLeft.text = "Осталось копить\nещё Х недель"
            mainView.progresslabel.text = "Накоплено 0 из 0 рублей"
            mainView.moneyLeft.text = "Накопи ещё 0 рублей"
            mainView.goalImage.image = UIImage(named: "piggy")!
        }
    }
    
    @objc func addGoal() {
        let vc = AddGoalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func shareGoal() {
        print("shareGoal")
    }
}

