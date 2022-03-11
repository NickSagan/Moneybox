//
//  QuizVC.swift
//  Моя копилка сбережений
//
//  Created by Nick Sagan on 10.03.2022.
//

import UIKit

class QuizVC: UIViewController {
    
    var quizView: QuizView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "mainBg")!)
        quizView = QuizView()
        view.addSubview(quizView)
        quizView.translatesAutoresizingMaskIntoConstraints = false
        quizView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        

    }
}
