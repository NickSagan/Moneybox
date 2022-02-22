//
//  AddGoalVC.swift
//  Moneybox
//
//  Created by Nick Sagan on 22.02.2022.
//

import UIKit

class AddGoalVC: UIViewController {
    var addGoalView: AddGoalView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        addGoalView = AddGoalView()
        addGoalView.backgroundColor = .systemBackground
        view.addSubview(addGoalView)
        addGoalView.translatesAutoresizingMaskIntoConstraints = false
        addGoalView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }

//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done , target: self, action: #selector(shareGoal))
//
//        goal = GoalModel(name: "Lego NinjaGo", photo: UIImage(named: "piggy")!, price: 9000, savings: 3400, income: 1000)
//
//        refreshGoal()
    }
}
