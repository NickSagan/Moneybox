//
//  FinishQuizVC.swift
//  Моя копилка сбережений
//
//  Created by Nick Sagan on 13.03.2022.
//

import UIKit
import SnapKit

class FinishQuizVC: UIViewController {
    
    var congratsView: FinishQuizView!
    var score: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "congrats")!)
        congratsView = FinishQuizView()
        congratsView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(congratsView)
        
        congratsView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        
        congratsView.subTitle.text = "Правильных ответов: \(score!) из 7. Вы умеете копить и обладаете базовой финансовой грамотностью."
        
        congratsView.newGoalButton.addTarget(self, action: #selector(setNewGoal), for: .touchUpInside)
    }
    
    @objc func setNewGoal() {
        let vc = AddGoalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
