//
//  QuizVC.swift
//  Моя копилка сбережений
//
//  Created by Nick Sagan on 10.03.2022.
//

import UIKit

class QuizVC: UIViewController {
    
    var quizView: QuizView!
    let quiz = Quiz()
    var questionNum: Int = 0
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        displayQuestion()
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "mainBg")!)
        quizView = QuizView()
        view.addSubview(quizView)
        quizView.translatesAutoresizingMaskIntoConstraints = false
        quizView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
        quizView.answer1.addTarget(self, action: #selector(answer1Button), for: .touchUpInside)
        quizView.answer2.addTarget(self, action: #selector(answer2Button), for: .touchUpInside)
        quizView.answer3.addTarget(self, action: #selector(answer3Button), for: .touchUpInside)
    }
    
    func displayQuestion() {
        quizView.question.text = quiz.questions[questionNum].question
        quizView.answer1.setTitle(quiz.questions[questionNum].answer1, for: .normal)
        quizView.answer2.setTitle(quiz.questions[questionNum].answer2, for: .normal)
        quizView.answer3.setTitle(quiz.questions[questionNum].answer3, for: .normal)
    }
    
    @objc func answer1Button() {
        
    }
    
    @objc func answer2Button() {
        
    }
    
    @objc func answer3Button() {
        
    }
}
