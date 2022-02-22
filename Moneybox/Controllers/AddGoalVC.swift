//
//  AddGoalVC.swift
//  Moneybox
//
//  Created by Nick Sagan on 22.02.2022.
//

import UIKit

class AddGoalVC: UIViewController {
    
    var addGoalView: AddGoalView!
    var done: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc private func addGoal() {

    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        addGoalView = AddGoalView()
        addGoalView.backgroundColor = .systemBackground
        view.addSubview(addGoalView)
        addGoalView.translatesAutoresizingMaskIntoConstraints = false
        addGoalView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        
        done = UIBarButtonItem(barButtonSystemItem: .done , target: self, action: #selector(addGoal))
        done.isEnabled = false
        navigationItem.rightBarButtonItem = done
        
        // Tap recognizer to dismiss keyboard
        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        tapGestureReconizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureReconizer)
        
        // Set delegates
        addGoalView.incomeInput.delegate = self
        addGoalView.savingsInput.delegate = self
        addGoalView.priceInput.delegate = self
        addGoalView.nameInput.delegate = self
    }
    
    // Dismiss keyboard
    @objc private func tap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

//MARK: - UITextViewDelegate

extension AddGoalVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkTextfields()
    }
    
    func checkTextfields() {
        if addGoalView.incomeInput.text != "" && addGoalView.savingsInput.text != "" && addGoalView.priceInput.text != "" && addGoalView.nameInput.text != "" {
            done.isEnabled = true
        } else {
            done.isEnabled = false
        }
    }
}
