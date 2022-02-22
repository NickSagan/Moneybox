//
//  AddGoalVC.swift
//  Moneybox
//
//  Created by Nick Sagan on 22.02.2022.
//

import UIKit

class AddGoalVC: UIViewController {
    
    var addGoalView: AddGoalView!
    var addImageView: AddImageView!
    
    var currentImage: UIImage!
    var name: String!
    var price: Int!
    var savings: Int!
    var income: Int!
    
    let nextButton: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.style = .plain
        btn.title = "Далее"
        btn.isEnabled = false
        btn.action = #selector(addGoal)
        return btn
    }()
    
    let finishButton: UIBarButtonItem = {
        let btn = UIBarButtonItem()
        btn.style = .plain
        btn.title = "Завершить"
        btn.isEnabled = false
        btn.action = #selector(addGoalModel)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc private func addGoalModel() {
    
    }
    
    @objc private func addImage() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc private func addGoal() {
        // TODO: add animation
        
        name = addGoalView.nameInput.text
        let priceValue = addGoalView.priceInput.text ?? "0"
        price = Int(priceValue)!
        let savingsValue = addGoalView.savingsInput.text ?? "0"
        savings = Int(savingsValue)!
        let incomeValue = addGoalView.incomeInput.text ?? "0"
        income = Int(incomeValue)!
        
        // addGoalView => addImageView
        addGoalView.removeFromSuperview()
        addImageView = AddImageView()
        addImageView.backgroundColor = .systemBackground
        addImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addImageView)
        addImageView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        addImageView.button.addTarget(self, action: #selector(addImage), for: .touchUpInside)
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
        
        navigationItem.rightBarButtonItem = nextButton
        
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
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
}

//MARK: - UIImagePicker
extension AddGoalVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        currentImage = image
    }
}
