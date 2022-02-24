//
//  AddGoalVC.swift
//  Moneybox
//
//  Created by Nick Sagan on 22.02.2022.
//

import UIKit

class AddGoalVC: UIViewController {
    
    let imagePicker = UIImagePickerController()
    
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
        imagePicker.delegate = self
    }
    
    @objc private func addGoalModel() {
        let goal = GoalModel(name: name, photo: currentImage, price: price, savings: savings, income: income)
        GoalManager.shared.setGoal(goal)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func addImage() {
        let alert = UIAlertController(title: "Выберите фото", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Камера", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Галерея", style: .default, handler: { _ in
            self.openGallery()
        }))
        alert.addAction(UIAlertAction.init(title: "Отмена", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        navigationItem.rightBarButtonItem = finishButton
        finishButton.target = self
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
        nextButton.target = self
        
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
            
            if let savings = Int(addGoalView.savingsInput.text!), let price = Int(addGoalView.priceInput.text!), savings >= price {
                addGoalView.errorLabel.text = "Накопления должны быть меньше стоимости цели"
                nextButton.isEnabled = false
            } else {
                addGoalView.errorLabel.text = ""
                nextButton.isEnabled = true
            }
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
        addImageView.imageView.image = currentImage
        finishButton.isEnabled = true
    }
    
    func openCamera() {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            let alert  = UIAlertController(title: "Ошибка", message: "У вас нет камеры", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery() {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
}
