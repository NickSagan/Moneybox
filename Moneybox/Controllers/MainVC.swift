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
    let goalManager = GoalManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        setAppearance()
        refreshGoal(goalManager.getGoal())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        goalManager.delegate = self
        setupVC()
    }
    
    func refreshGoal(_ goal: GoalModel) {
        mainView.goalName.text = "Цель: \(goal.name)"
        mainView.weeksLeft.text = "Осталось копить\nещё \((goal.price - goal.savings) / (goal.income + 1)) недель"
        mainView.progresslabel.text = "Накоплено \(goal.savings) из \(goal.price) рублей"
        mainView.moneyLeft.text = "Накопи ещё \(goal.price - goal.savings) рублей"
        mainView.goalImage.image = goal.photo
    }
    
    @objc func addGoal() {
        let vc = AddGoalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func shareGoal() {
        print("shareGoal")
    }
    
    func setupVC() {
        mainView = MainView()
        mainView.backgroundColor = UIColor.white.withAlphaComponent(0)
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addGoal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareGoal))
    }
    
    func setAppearance() {
        if traitCollection.userInterfaceStyle == .dark {
            self.view.backgroundColor = .systemGray
        } else {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        }
    }
}

//MARK: - GoalModelDelegate

extension MainVC: GoalModelDelegate {
    
    func goalModelRecieved(_ goalModel: GoalModel) {
        refreshGoal(goalModel)
    }
}
