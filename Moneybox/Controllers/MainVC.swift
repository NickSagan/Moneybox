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
        mainView.progressBar.progress = ((CGFloat(goal.savings) * 100.0) / CGFloat(goal.price)) / 100.0
    }
    
    func calculate(amount: Int) {
        if amount == 0 { return }
        var goal = goalManager.getGoal()
        
        let counter = amount > 0 ? 1 : -1
        let repeatTimes = abs(amount)
        
        let duration: Double = 1.5 // how fast animation will be
        let sleepTime = UInt32(duration/Double(repeatTimes) * 1000000.0)
        
        DispatchQueue.global().async {
            for _ in 1...repeatTimes {
                goal.savings += counter
                usleep(sleepTime)
                DispatchQueue.main.async {
//                    self.mainView.progresslabel.text = "Накоплено \(goal.savings) из \(goal.price) рублей"
                    self.mainView.moneyLeft.text = "Накопи ещё \(goal.price - goal.savings) рублей"
                    self.mainView.progressBar.progress = ((CGFloat(goal.savings) * 100.0) / CGFloat(goal.price)) / 100.0
                }
            }
            DispatchQueue.main.async {
                self.goalManager.setGoal(goal)
            }
        }
    }
    
    @objc func addGoal() {
        let vc = AddGoalVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func shareGoal() {
        let goal = goalManager.getGoal()
        let items: [Any] = ["Привет! Моя цель: \(goal.name). Всего надо накопить: \(goal.price), я уже накопил \(goal.savings), помоги мне накопить оставшуюсь сумму. Спасибо! Сообщение отправлено из мобильного приложения Копилка-MoneyBox для iPhone"]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        ac.excludedActivityTypes = [.airDrop, .addToReadingList, .openInIBooks, .saveToCameraRoll]
        present(ac, animated: true)
    }
    
    @objc func plusButton() {
        let ac = UIAlertController(title: "Добавить средства", message: nil, preferredStyle: .alert)
        ac.addTextField { textField in
            textField.placeholder = "500"
            textField.keyboardType = .decimalPad
        }
        ac.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { _ in
            let textField = ac.textFields![0] as UITextField
            let amount = Int(textField.text ?? "0")!
            self.calculate(amount: amount)
        }))
        ac.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        self.present(ac, animated: true, completion: nil)
    }
    
    @objc func minusButton() {
        let ac = UIAlertController(title: "Убавить средства", message: nil, preferredStyle: .alert)
        ac.addTextField { textField in
            textField.placeholder = "500"
            textField.keyboardType = .decimalPad
        }
        ac.addAction(UIAlertAction(title: "Убавить", style: .default, handler: { _ in
            let textField = ac.textFields![0] as UITextField
            let amount = Int(textField.text ?? "0")!
            self.calculate(amount: -amount)
        }))
        ac.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        self.present(ac, animated: true, completion: nil)
    }
    
    func setupVC() {
        mainView = MainView()
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        mainView.plusButton.addTarget(self, action: #selector(plusButton), for: .touchUpInside)
        mainView.minusButton.addTarget(self, action: #selector(minusButton), for: .touchUpInside)
        
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
